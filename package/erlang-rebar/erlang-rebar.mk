#############################################################
#
# erlang-rebar
#
#############################################################

ERLANG_REBAR_VERSION = 620c4b01c6
ERLANG_REBAR_SITE = http://github.com/rebar/rebar/tarball/$(ERLANG_REBAR_VERSION)
ERLANG_REBAR_LICENSE = Apache-2.0 
ERLANG_REBAR_LICENSE_FILE = LICENSE 

ERLANG_REBAR_DEPENDENCIES = erlang host-erlang
HOST_ERLANG_REBAR_DEPENDENCIES = host-erlang

define ERLANG_REBAR_BUILD_CMDS
	(cd $(@D); $(HOST_MAKE_ENV) ./bootstrap)
endef

define ERLANG_REBAR_INSTALL_TARGET_CMDS
	cp $(@D)/rebar $(TARGET_DIR)/usr/bin
endef

define HOST_ERLANG_REBAR_BUILD_CMDS
	(cd $(@D); $(HOST_MAKE_ENV) ./bootstrap)
endef

define HOST_ERLANG_REBAR_INSTALL_CMDS
	cp $(@D)/rebar $(HOST_DIR)/usr/bin
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
