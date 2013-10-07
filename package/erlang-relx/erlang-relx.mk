#############################################################
#
# erlang-relx
#
#############################################################

ERLANG_RELX_VERSION = 37bd98a
ERLANG_RELX_SITE = http://github.com/erlware/relx/tarball/$(ERLANG_RELX_VERSION)
ERLANG_RELX_LICENSE = Apache-2.0 
ERLANG_RELX_LICENSE_FILE = LICENSE.md

ERLANG_RELX_DEPENDENCIES = erlang host-erlang host-erlang-rebar
HOST_ERLANG_RELX_DEPENDENCIES = host-erlang host-erlang-rebar

# Macro for invoking relx in other packages
RELX = $(HOST_MAKE_ENV) \
	$(HOST_DIR)/usr/bin/relx

define HOST_ERLANG_RELX_EXTRACT_CMDS
	mkdir -p $(@D)/relx
	gzip -d -c $(DL_DIR)/$(ERLANG_RELX_SOURCE) | tar --strip-components=1 -C $(@D)/relx -xf -
endef

define ERLANG_RELX_BUILD_CMDS
	$(MAKE) -C $(@D)/relx
endef

define ERLANG_RELX_INSTALL_TARGET_CMDS
	cp $(@D)/relx/relx $(TARGET_DIR)/usr/bin
endef

define HOST_ERLANG_RELX_BUILD_CMDS
	$(MAKE) -C $(@D)/relx
endef

define HOST_ERLANG_RELX_INSTALL_CMDS
	cp $(@D)/relx/relx $(HOST_DIR)/usr/bin
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
