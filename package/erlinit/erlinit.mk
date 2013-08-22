################################################################################
#
# erlinit
#
################################################################################

ERLINIT_VERSION = e628eba
ERLINIT_SITE = http://github.com/fhunleth/erlinit/tarball/$(ERLINIT_VERSION)
ERLINIT_LICENSE = MIT 

# Make sure erlinit wins over busybox init
ifeq ($(BR2_PACKAGE_BUSYBOX),y)
ERLINIT_DEPENDENCIES += busybox
endif

define ERLINIT_BUILD_CMDS
	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define ERLINIT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 755 $(@D)/erlinit $(TARGET_DIR)/sbin/init
endef

$(eval $(generic-package))
