#############################################################
#
# erlang-relx
#
#############################################################

ERLANG_RELX_VERSION = 73b166d
ERLANG_RELX_SITE = http://github.com/erlware/relx/tarball/$(ERLANG_RELX_VERSION)
ERLANG_RELX_LICENSE = Apache-2.0 
ERLANG_RELX_LICENSE_FILE = LICENSE.md

HOST_ERLANG_RELX_DEPENDENCIES = host-erlang host-erlang-rebar

# Macro for invoking relx in other packages
RELX = $(HOST_MAKE_ENV) \
	$(HOST_DIR)/usr/bin/relx -l $(STAGING_DIR)/usr/lib/erlang/lib

define HOST_ERLANG_RELX_BUILD_CMDS
	$(MAKE1) -C $(@D)
endef

define HOST_ERLANG_RELX_INSTALL_CMDS
	cp $(@D)/relx $(HOST_DIR)/usr/bin
endef

$(eval $(host-generic-package))
