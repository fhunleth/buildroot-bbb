#############################################################
#
# erlang-cowboy
#
#############################################################

ERLANG_COWBOY_VERSION = 0.8.6
ERLANG_COWBOY_SITE = http://github.com/extend/cowboy/tarball/$(ERLANG_COWBOY_VERSION)
ERLANG_COWBOY_LICENSE = ISC 
ERLANG_COWBOY_LICENSE_FILE = LICENSE 
ERLANG_COWBOY_INSTALL_DIR = $(ERLANG_PACKAGE_INSTALL_DIR)/cowboy

ERLANG_COWBOY_DEPENDENCIES = erlang host-erlang-rebar erlang-ranch

define ERLANG_COWBOY_BUILD_CMDS
	(cd $(@D); $(REBAR) compile)
endef

define ERLANG_COWBOY_INSTALL_TARGET_CMDS
	for d in ebin; \
	do \
		$(INSTALL) -d $(ERLANG_COWBOY_INSTALL_DIR)/$$d && \
		$(INSTALL) -m 0644 -t $(ERLANG_COWBOY_INSTALL_DIR)/$$d $(@D)/$$d/*; \
	done
endef

$(eval $(generic-package))
