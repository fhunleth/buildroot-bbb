#############################################################
#
# erlang-procket
#
#############################################################

ERLANG_PROCKET_VERSION = 43a85fba3c
ERLANG_PROCKET_SITE = http://github.com/msantos/procket/tarball/$(ERLANG_PROCKET_VERSION)
ERLANG_PROCKET_LICENSE = BSD-3c
ERLANG_PROCKET_INSTALL_DIR = $(ERLANG_PACKAGE_INSTALL_DIR)/procket

ERLANG_PROCKET_DEPENDENCIES = erlang host-erlang-rebar libpcap

define ERLANG_PROCKET_BUILD_CMDS
	# Make the native code directly so that the correct target compiler
	# and flags are correct.
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/c_src -f Makefile.ancillary
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/c_src -f Makefile.cmd
	(cd $(@D); $(REBAR) compile)
endef

define ERLANG_PROCKET_INSTALL_TARGET_CMDS
	for d in ebin include priv; \
	do \
	$(INSTALL) -d $(ERLANG_NETLINK_INSTALL_DIR)/$$d && \
		$(INSTALL) -m 0644 -t $(ERLANG_NETLINK_INSTALL_DIR)/$$d $(@D)/$$d/*; \
	done
endef

$(eval $(generic-package))
