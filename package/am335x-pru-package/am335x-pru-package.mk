################################################################################
#
# am335x-pru-package
#
################################################################################

AM335X_PRU_PACKAGE_VERSION = e363612
AM335X_PRU_PACKAGE_SITE = http://github.com/beagleboard/am335x_pru_package/tarball/$(AM335X_PRU_PACKAGE_VERSION)
AM335X_PRU_PACKAGE_LICENSE = BSD-3c
AM335X_PRU_PACKAGE_LICENSE_FILES = pru_sw/utils/LICENCE.txt
AM335X_PRU_PACKAGE_DEPENDENCIES = host-am335x-pru-package
AM335X_PRU_PACKAGE_INSTALL_STAGING = YES

define AM335X_PRU_PACKAGE_BUILD_CMDS
	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
		-C $(@D)/pru_sw/app_loader/interface all
	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
		PASM=$(HOST_DIR)/usr/bin/pasm -C $(@D)/pru_sw/example_apps all
endef

define AM335X_PRU_PACKAGE_INSTALL_STAGING_CMDS
	$(INSTALL) -m 0644 -D $(@D)/pru_sw/app_loader/lib/libprussdrv.a \
		$(STAGING_DIR)/usr/lib/libprussdrv.a
	$(INSTALL) -m 0644 -D $(@D)/pru_sw/app_loader/include/prussdrv.h \
		$(STAGING_DIR)/usr/include/prussdrv.h
	$(INSTALL) -m 0644 -D $(@D)/pru_sw/app_loader/include/pruss_intc_mapping.h \
		$(STAGING_DIR)/usr/include/pruss_intc_mapping.h
endef

define AM335X_PRU_PACKAGE_INSTALL_TARGET_CMDS
	# Binaries
	$(INSTALL) -m 0755 -D $(@D)/pru_sw/example_apps/bin/PRU_memAccess_DDR_PRUsharedRAM \
		 $(TARGET_DIR)/usr/bin/PRU_memAccess_DDR_PRUsharedRAM
	$(INSTALL) -m 0755 -D $(@D)/pru_sw/example_apps/bin/PRU_memAccessPRUDataRam \
		 $(TARGET_DIR)/usr/bin/PRU_memAccess_DDR_PRUDataRam
	$(INSTALL) -m 0755 -D $(@D)/pru_sw/example_apps/bin/PRU_PRUtoPRU_Interrupt \
		 $(TARGET_DIR)/usr/bin/PRU_PRUtoPRU_Interrupt

	# Firmware
	$(INSTALL) -m 0755 -D $(@D)/pru_sw/example_apps/bin/PRU_memAccess_DDR_PRUsharedRAM.bin \
		 $(TARGET_DIR)/usr/bin/PRU_memAccess_DDR_PRUsharedRAM.bin
	$(INSTALL) -m 0755 -D $(@D)/pru_sw/example_apps/bin/PRU_memAccessPRUDataRam.bin \
		 $(TARGET_DIR)/usr/bin/PRU_memAccessPRUDataRam.bin
	$(INSTALL) -m 0755 -D $(@D)/pru_sw/example_apps/bin/PRU_PRU0toPRU1_Interrupt.bin \
		 $(TARGET_DIR)/usr/bin/PRU_PRU0toPRU1_Interrupt.bin
	$(INSTALL) -m 0755 -D $(@D)/pru_sw/example_apps/bin/PRU_PRU1toPRU0_Interrupt.bin \
		 $(TARGET_DIR)/usr/bin/PRU_PRU1toPRU0_Interrupt.bin
endef

define HOST_AM335X_PRU_PACKAGE_BUILD_CMDS
	cd $(@D)/pru_sw/utils/pasm_source && \
		$(HOSTCC) -D_UNIX_ pasm.c pasmpp.c pasmexp.c pasmop.c \
			pasmdot.c pasmstruct.c pasmmacro.c -o ../pasm
endef

define HOST_AM335X_PRU_PACKAGE_INSTALL_CMDS
	$(INSTALL) -m 0755 -D $(@D)/pru_sw/utils/pasm $(HOST_DIR)/usr/bin/pasm
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
