#############################################################
#
# erlang-goldrush
#
#############################################################

ERLANG_GOLDRUSH_VERSION = 879c69874a
ERLANG_GOLDRUSH_SITE = http://github.com/Deadzen/goldrush/tarball/$(ERLANG_GOLDRUSH_VERSION)
ERLANG_GOLDRUSH_LICENSE = ISC 
ERLANG_GOLDRUSH_LICENSE_FILE = LICENSE 
ERLANG_GOLDRUSH_INSTALL_DIR = $(ERLANG_PACKAGE_INSTALL_DIR)/goldrush

ERLANG_GOLDRUSH_DEPENDENCIES = erlang host-erlang-rebar

define ERLANG_GOLDRUSH_BUILD_CMDS
	(cd $(@D); $(REBAR) compile)
endef

define ERLANG_GOLDRUSH_INSTALL_TARGET_CMDS
	mkdir -p $(ERLANG_GOLDRUSH_INSTALL_DIR)/ebin
	cp $(@D)/ebin/* $(ERLANG_GOLDRUSH_INSTALL_DIR)/ebin
endef

$(eval $(generic-package))
