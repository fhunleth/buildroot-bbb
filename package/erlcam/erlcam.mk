#############################################################
#
# erlcam
#
#############################################################

ERLCAM_VERSION = d5cc9dd
#ERLCAM_SITE = http://github.com/fhunleth/erlcam/tarball/$(ERLCAM_VERSION)
ERLCAM_SITE = file://$(TOPDIR)/../erlcam
ERLCAM_SITE_METHOD = git
ERLCAM_LICENSE = ISC 
ERLCAM_LICENSE_FILE = LICENSE 
ERLCAM_INSTALL_DIR = $(ERLANG_PACKAGE_INSTALL_DIR)/erlcam

ERLCAM_DEPENDENCIES = erlang host-erlang-rebar erlang-cowboy

define ERLCAM_BUILD_CMDS
	(cd $(@D); $(REBAR) compile)
endef

define ERLCAM_INSTALL_TARGET_CMDS
	for d in ebin; \
	do \
		$(INSTALL) -d $(ERLCAM_INSTALL_DIR)/$$d && \
		$(INSTALL) -m 0644 -t $(ERLCAM_INSTALL_DIR)/$$d $(@D)/$$d/*; \
	done
endef

$(eval $(generic-package))
