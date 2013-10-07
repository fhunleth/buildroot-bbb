#############################################################
#
# erlang-rebar
#
#############################################################

ERLANG_REBAR_VERSION = 179ed48
ERLANG_REBAR_SITE = http://github.com/rebar/rebar/tarball/$(ERLANG_REBAR_VERSION)
ERLANG_REBAR_LICENSE = Apache-2.0 
ERLANG_REBAR_LICENSE_FILE = LICENSE 

HOST_ERLANG_REBAR_DEPENDENCIES = host-erlang

ERLANG_ERTS_DIR = `ls -d $(STAGING_DIR)/usr/lib/erlang/erts-*`
ERLANG_ERL_INTERFACE_DIR = `ls -d $(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-*`

# Macro for invoking rebar in other packages
REBAR = $(HOST_MAKE_ENV) \
	CC="$(TARGET_CC)" \
	CXX="$(TARGET_CXX)" \
	CFLAGS="$(TARGET_CFLAGS)" \
	CXXFLAGS="$(TARGET_CXXFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)" \
	ERL_CFLAGS="-I$(ERLANG_ERTS_DIR)/include -I$(ERLANG_ERL_INTERFACE_DIR)/include" \
	ERL_LDFLAGS="-L$(ERLANG_ERTS_DIR)/lib -L$(ERLANG_ERL_INTERFACE_DIR)/lib -lerts -lei" \
	$(HOST_DIR)/usr/bin/rebar -vv

define HOST_ERLANG_REBAR_BUILD_CMDS
	(cd $(@D); $(HOST_MAKE_ENV) ./bootstrap)
endef

define HOST_ERLANG_REBAR_INSTALL_CMDS
	cp $(@D)/rebar $(HOST_DIR)/usr/bin
endef

$(eval $(host-generic-package))
