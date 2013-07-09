################################################################################
#
# angularjs
#
################################################################################

ANGULARJS_VERSION = 1.0.7
ANGULARJS_SITE = http://code.angularjs.org/$(ANGULARJS_VERSION)
ANGULARJS_SOURCE = angular.min.js
ANGULARJS_LICENSE = MIT

define ANGULARJS_EXTRACT_CMDS
	cp $(DL_DIR)/$(ANGULARJS_SOURCE) $(@D)
endef

define ANGULARJS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(@D)/$(ANGULARJS_SOURCE) \
		$(TARGET_DIR)/var/www/angular.js
endef

define ANGULARJS_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/var/www/angular.js
endef

$(eval $(generic-package))
