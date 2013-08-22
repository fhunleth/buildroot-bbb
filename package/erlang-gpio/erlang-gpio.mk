#############################################################
#
# erlang-gpio
#
#############################################################

ERLANG_GPIO_VERSION = 3f967af
ERLANG_GPIO_SITE = http://github.com/fhunleth/gpio/tarball/$(ERLANG_GPIO_VERSION)
ERLANG_GPIO_LICENSE = MPLv2.0
ERLANG_GPIO_LICENSE_FILE = LICENSE
ERLANG_GPIO_INSTALL_DIR = $(ERLANG_PACKAGE_INSTALL_DIR)/gpio

ERLANG_GPIO_DEPENDENCIES = erlang host-erlang-rebar erlang-lager

define ERLANG_GPIO_BUILD_CMDS
	(cd $(@D); $(REBAR) compile)
endef

define ERLANG_GPIO_INSTALL_TARGET_CMDS
	for d in ebin include priv; \
	do \
	$(INSTALL) -d $(ERLANG_GPIO_INSTALL_DIR)/$$d && \
		$(INSTALL) -m 0644 -t $(ERLANG_GPIO_INSTALL_DIR)/$$d $(@D)/$$d/*; \
	done
endef

$(eval $(generic-package))
