#############################################################
#
# erlang-nerves
#
#############################################################

ERLANG_NERVES_VERSION = 53c931d17b
ERLANG_NERVES_SITE = http://github.com/nerves-project/nerves/tarball/$(ERLANG_NERVES_VERSION)
#ERLANG_NERVES_LICENSE = ISC
#ERLANG_NERVES_LICENSE_FILE = LICENSE
ERLANG_NERVES_INSTALL_DIR = $(ERLANG_PACKAGE_INSTALL_DIR)/nerves

ERLANG_NERVES_DEPENDENCIES = erlang host-erlang-rebar

define ERLANG_NERVES_BUILD_CMDS
	(cd $(@D); $(REBAR) compile)
endef

define ERLANG_NERVES_INSTALL_TARGET_CMDS
	mkdir -p $(ERLANG_NERVES_INSTALL_DIR)/ebin
	cp $(@D)/ebin/* $(ERLANG_NERVES_INSTALL_DIR)/ebin
endef

$(eval $(generic-package))
