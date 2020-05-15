#ifndef CORE_H
#define CORE_H
    #ifdef __APPLE__
        #define SCY_MAC_BUILD
        #define SCY_API
    #elif defined(WIN_32)
        #define SCY_WINDOWS_BUILD
        #ifdef SCY_BUILD_DLL
            #define SCY_API __declspec(dllexport)
        #else
            #define SCY_API __declspec(dllimport)
        #endif
    #endif
#endif