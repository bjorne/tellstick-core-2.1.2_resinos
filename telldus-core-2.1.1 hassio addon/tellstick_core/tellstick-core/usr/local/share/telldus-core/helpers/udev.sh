#!/bin/sh

if [ "${ID_VENDOR_ID}" = "1781" ]; then
	if [ "${ACTION}" = "add" ]; then
		/usr/local/sbin/tdadmin controller connect --pid=${ID_MODEL_ID} --vid=${ID_VENDOR_ID} --serial=${ID_SERIAL_SHORT}
	elif [ "${ACTION}" = "remove" ]; then
		/usr/local/sbin/tdadmin controller disconnect --pid=${ID_MODEL_ID} --vid=${ID_VENDOR_ID} --serial=${ID_SERIAL_SHORT}
	fi
fi
