#ifdef _WIN32
#include <windows.h>
#include <string.h>

int gettimeofday(struct timeval *tv, void *tz) {
    FILETIME ft;
    unsigned __int64 tmpres = 0;
    GetSystemTimeAsFileTime(&ft);
    tmpres |= ft.dwHighDateTime;
    tmpres <<= 32;
    tmpres |= ft.dwLowDateTime;
    tmpres /= 10;
    tmpres -= 11644473600000000ULL;
    tv->tv_sec = (long)(tmpres / 1000000UL);
    tv->tv_usec = (long)(tmpres % 1000000UL);
    return 0;
}

#define strcasecmp _stricmp

void usleep(__int64 usec) {
    HANDLE timer = CreateWaitableTimer(NULL, TRUE, NULL);
    LARGE_INTEGER ft;
    ft.QuadPart = -(10 * usec);
    SetWaitableTimer(timer, &ft, 0, NULL, NULL, 0);
    WaitForSingleObject(timer, INFINITE);
    CloseHandle(timer);
}
#endif

#include "load81.c"
#include "editor.c"
#include "framebuffer.c"
