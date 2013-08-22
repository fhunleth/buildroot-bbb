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

# Macro for invoking rebar in other packages
REBAR = $(HOST_MAKE_ENV) \
	CC="$(TARGET_CC)" \
	CXX="$(TARGET_CXX)" \
	CFLAGS="$(TARGET_CFLAGS)" \
	CXXFLAGS="$(TARGET_CXXFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)" \
	ERL_CFLAGS="-I$(STAGING_DIR)/usr/lib/erlang/erts-5.9.3.1/include -I$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-3.7.9/include" \
	ERL_LDFLAGS="-L$(STAGING_DIR)/usr/lib/erlang/erts-5.9.3.1/lib -L$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-3.7.9/lib -lerts -lei" \
	$(HOST_DIR)/usr/bin/rebar -vvv deps_dir=$(ERLANG_PACKAGE_INSTALL_DIR)

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
