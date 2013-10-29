#############################################################
#
# erlang-fwtool
#
#############################################################

ERLANG_FWTOOL_VERSION = b2f63a19906b74d1f57709362813335260796cbb
ERLANG_FWTOOL_SITE = http://github.com/nerves-project/fwtool/tarball/$(ERLANG_FWTOOL_VERSION)
ERLANG_FWTOOL_LICENSE = MIT 
ERLANG_FWTOOL_LICENSE_FILE = LICENSE.md

HOST_ERLANG_FWTOOL_DEPENDENCIES = host-erlang host-erlang-rebar

# Macro for invoking relx in other packages
FWTOOL = $(HOST_MAKE_ENV) \
	$(HOST_DIR)/usr/bin/fwtool

define HOST_ERLANG_FWTOOL_BUILD_CMDS
	$(MAKE1) -C $(@D)
endef

define HOST_ERLANG_FWTOOL_INSTALL_CMDS
	cp $(@D)/fwtool $(HOST_DIR)/usr/bin
endef

$(eval $(host-generic-package))
