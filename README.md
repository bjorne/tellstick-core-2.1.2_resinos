# resinOS binaries and source for telldus-core 2.1.2

telldus-core is (c) Telldus

Original files can be found here http://developer.telldus.com/ or https://github.com/telldus/telldus/tree/master/telldus-core

Modified to enable compilation on resinOS in order to try to get tellstick duo working on hass.io.

Binaries folder contain executables and files compiled on raspberry pi 3 (via hass.io ssh add-on). 

* Binaries are dependant upon confuse, libftdi1 and libstdc++ 
(apk add --no-cache confuse libftdi1 libstdc++)

* Added hass.io addon files in order to try to get the daemon and libraries to just execute.
In order for the telldus daemon to execute in a docker it needs access to usb (/dev/bus/usb)


Source archive contain modified source for telldus-core 2.1.2 to enable compilation. 
Source archive also includes build.sh that automates all build steps, including installation of dependancy libraries and compilers.


### Following changes has been made:
```
service/CMakeLists.txt
	Change:
		ftdi to ftdi1 on line 187

		
common/Socket_unix.cpp
	add:
		#include <sys/select.h>
		#include <unistd.h>

service/TellStick_libftdi.cpp
	Change:
		from #include <ftdi.h> to: #include <libftdi1/ftdi.h>
		
tdadmin/CMakeLists.txt	
	Change:
		From:
			ELSE (WIN32)
				TARGET_LINK_LIBRARIES(tdadmin
					${CMAKE_BINARY_DIR}/client/libtelldus-core.so
				)
			ENDIF (WIN32)

		To:
			ELSE (WIN32)
				FIND_LIBRARY(ARGP_LIBRARY argp)
				TARGET_LINK_LIBRARIES(tdadmin
					${CMAKE_BINARY_DIR}/client/libtelldus-core.so
					${ARGP_LIBRARY}
			)
			ENDIF (WIN32)
```

