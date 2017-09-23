# resinOS binaries and source for telldus-core 2.1.2

telldus-core is (c) Telldus 
Original files can be found here http://developer.telldus.com/

Modified to enable compilation on resinOS in order to try to get tellstick duo working on hass.io.

Binaries archive contain executables and files created by make install. 
(May require chmod +x for the binaries?)

Source archive contain modified complete source for telldus-core 2.1.2 
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

