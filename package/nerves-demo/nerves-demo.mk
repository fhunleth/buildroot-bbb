#############################################################
#
# nerves-demo
#
#############################################################

NERVES_DEMO_VERSION = d5f7743966
NERVES_DEMO_SITE = http://github.com/nerves-project/nerves-demo/tarball/$(NERVES_DEMO_VERSION)
NERVES_DEMO_LICENSE = MIT
NERVES_DEMO_INSTALL_DIR = $(TARGET_DIR)/srv/erlang

NERVES_DEMO_DEPENDENCIES = erlang host-erlang-rebar host-erlang-relx

define NERVES_DEMO_BUILD_CMDS
	(cd $(@D); $(REBAR) get-deps compile && $(RELX))
endef

define NERVES_DEMO_INSTALL_TARGET_CMDS
	mkdir -p $(NERVES_DEMO_INSTALL_DIR)
	cp -r $(@D)/_rel/* $(NERVES_DEMO_INSTALL_DIR)
endef

$(eval $(generic-package))
