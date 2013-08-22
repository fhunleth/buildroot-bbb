#############################################################
#
# erlang-lager
#
#############################################################

ERLANG_LAGER_VERSION = 2.0.0
ERLANG_LAGER_SITE = http://github.com/basho/lager/tarball/$(ERLANG_LAGER_VERSION)
ERLANG_LAGER_LICENSE = Apache-2.0 
ERLANG_LAGER_LICENSE_FILE = LICENSE 
ERLANG_LAGER_INSTALL_DIR = $(ERLANG_PACKAGE_INSTALL_DIR)/lager

ERLANG_LAGER_DEPENDENCIES = erlang host-erlang-rebar erlang-goldrush

define ERLANG_LAGER_BUILD_CMDS
	(cd $(@D); $(REBAR) compile)
endef

define ERLANG_LAGER_INSTALL_TARGET_CMDS
	for d in ebin include; \
	do \
		$(INSTALL) -d $(ERLANG_LAGER_INSTALL_DIR)/$$d && \
		$(INSTALL) -m 0644 -t $(ERLANG_LAGER_INSTALL_DIR)/$$d $(@D)/$$d/*; \
	done
endef

$(eval $(generic-package))
