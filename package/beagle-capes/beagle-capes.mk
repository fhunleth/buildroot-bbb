################################################################################
#
# beagle-capes 
#
################################################################################

BEAGLE_CAPES_SOURCE =

BEAGLE_CAPES_DEPENDENCIES = linux

define BEAGLE_CAPES_INSTALL_TARGET_CMDS
	$(INSTALL) -m 644 $(STAGING_DIR)/lib/firmware/*.dtbo $(TARGET_DIR)/lib/firmware/
endef

$(eval $(generic-package))
