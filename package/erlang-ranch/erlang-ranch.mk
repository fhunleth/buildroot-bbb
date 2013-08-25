#############################################################
#
# erlang-ranch
#
#############################################################

ERLANG_RANCH_VERSION = 0.8.5
ERLANG_RANCH_SITE = http://github.com/extend/ranch/tarball/$(ERLANG_RANCH_VERSION)
ERLANG_RANCH_LICENSE = ISC 
ERLANG_RANCH_LICENSE_FILE = LICENSE 
ERLANG_RANCH_INSTALL_DIR = $(ERLANG_PACKAGE_INSTALL_DIR)/ranch

ERLANG_RANCH_DEPENDENCIES = erlang host-erlang-rebar

define ERLANG_RANCH_BUILD_CMDS
	(cd $(@D); $(REBAR) compile)
endef

define ERLANG_RANCH_INSTALL_TARGET_CMDS
	mkdir -p $(ERLANG_RANCH_INSTALL_DIR)/ebin
	cp $(@D)/ebin/* $(ERLANG_RANCH_INSTALL_DIR)/ebin
endef

$(eval $(generic-package))
