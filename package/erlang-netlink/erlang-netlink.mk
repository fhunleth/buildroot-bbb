#############################################################
#
# erlang-netlink
#
#############################################################

ERLANG_NETLINK_VERSION = b951f8a
ERLANG_NETLINK_SITE = http://github.com/fhunleth/netlink/tarball/$(ERLANG_NETLINK_VERSION)
ERLANG_NETLINK_LICENSE = MPLv2.0
ERLANG_NETLINK_LICENSE_FILE = LICENSE
ERLANG_NETLINK_INSTALL_DIR = $(ERLANG_PACKAGE_INSTALL_DIR)/netlink

ERLANG_NETLINK_DEPENDENCIES = erlang host-erlang-rebar erlang-lager

define ERLANG_NETLINK_BUILD_CMDS
	(cd $(@D); $(REBAR) compile)
endef

define ERLANG_NETLINK_INSTALL_TARGET_CMDS
	for d in ebin include priv; \
	do \
	$(INSTALL) -d $(ERLANG_NETLINK_INSTALL_DIR)/$$d && \
		$(INSTALL) -m 0644 -t $(ERLANG_NETLINK_INSTALL_DIR)/$$d $(@D)/$$d/*; \
	done
endef

$(eval $(generic-package))
