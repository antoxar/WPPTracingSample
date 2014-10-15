#include <Wmistr.h>
#include <evntrace.h> // For TRACE_LEVEL definitions


#if !defined(EVENT_TRACING)

//
// TODO: These defines are missing in evntrace.h
// in some DDK build environments (XP).
//
#if !defined(TRACE_LEVEL_NONE)
  #define TRACE_LEVEL_NONE        0
  #define TRACE_LEVEL_CRITICAL    1
  #define TRACE_LEVEL_FATAL       1
  #define TRACE_LEVEL_ERROR       2
  #define TRACE_LEVEL_WARNING     3
  #define TRACE_LEVEL_INFORMATION 4
  #define TRACE_LEVEL_VERBOSE     5
  #define TRACE_LEVEL_RESERVED6   6
  #define TRACE_LEVEL_RESERVED7   7
  #define TRACE_LEVEL_RESERVED8   8
  #define TRACE_LEVEL_RESERVED9   9
#endif

//
// Define Debug Flags
//
#define FLAG_INIT        0x00000001
#define FLAG_TEST        0x00000002
#define FLAG_OTHER       0x00000004
#define FLAG_SERVICE     0x00000008



#define TraceEvents(...)


#define WPP_INIT_TRACING(RegistryPath)
#define WPP_CLEANUP()

#else
    
#define WPP_CHECK_FOR_NULL_STRING  //to prevent exceptions due to NULL strings

#define WPP_CONTROL_GUIDS \
    WPP_DEFINE_CONTROL_GUID(SimpleServiceProvider, (c34f5c45, 3569, 896c, ba85, bf8dcc85aa62), \
        WPP_DEFINE_BIT(FLAG_INIT)             /* bit  0 = 0x00000001 */ \
        WPP_DEFINE_BIT(FLAG_TEST)              /* bit  1 = 0x00000002 */ \
        WPP_DEFINE_BIT(FLAG_OTHER)           /* bit  2 = 0x00000004 */ \
        WPP_DEFINE_BIT(FLAG_SERVICE)           /* bit  3 = 0x00000008 */ \
 /* You can have up to 32 defines. If you want more than that,\
   you have to provide another trace control GUID */\
        )

#define WPP_LEVEL_FLAGS_LOGGER(lvl,flags) WPP_LEVEL_LOGGER(flags)
#define WPP_LEVEL_FLAGS_ENABLED(lvl, flags) (WPP_LEVEL_ENABLED(flags) && WPP_CONTROL(WPP_BIT_ ## flags).Level >= lvl)

#endif