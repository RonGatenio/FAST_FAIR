#ifndef UTIL_H_
#define UTIL_H_

#include <cstdlib>
#include <cstdint>
#include <emmintrin.h>

#define CPU_FREQ_MHZ (1994) // cat /proc/cpuinfo
#define CAS(_p, _u, _v) (__atomic_compare_exchange_n (_p, _u, _v, false, __ATOMIC_ACQUIRE, __ATOMIC_ACQUIRE))
#define kCacheLineSize (64)

#define kWriteLatencyInNS 10

static inline void CPUPause(void){
    __asm__ volatile("pause":::"memory");
}

static inline unsigned long ReadTSC(void) {
  unsigned long var;
  unsigned int hi, lo;
  asm volatile("rdtsc":"=a"(lo),"=d"(hi));
  var = ((unsigned long long int) hi << 32) | lo;
  return var;
}

inline void _pmemobj_persist(PMEMobjpool* pop, void* data, size_t len)
{
  volatile char *ptr = (char*)((unsigned long)data & (~(kCacheLineSize-1)));
  _mm_sfence();
  for (; ptr < ((char*)data)+len; ptr+=kCacheLineSize) {
    unsigned long etcs = ReadTSC() + (unsigned long) (kWriteLatencyInNS*CPU_FREQ_MHZ/1000);
    _mm_clflush((const void*)ptr);
    while (ReadTSC() < etcs) CPUPause();
  }
  _mm_sfence();

  pmemobj_persist(pop, data, len);
}

#endif
