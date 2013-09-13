################################################################################
#
# erlang
#
################################################################################

ERLANG_VERSION = R16B01
ERLANG_SITE = http://www.erlang.org/download
ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
ERLANG_DEPENDENCIES = host-erlang
HOST_ERLANG_DEPENDENCIES =

ERLANG_LICENSE = EPL
ERLANG_LICENSE_FILES = EPLICENCE
ERLANG_INSTALL_STAGING = YES

ERLANG_INSTALL_STAGING = YES
ERLANG_PACKAGE_INSTALL_DIR = $(TARGET_DIR)/usr/lib/erlang/lib

# The configure checks for these functions fail incorrectly
ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes

# Set erl_xcomp variables. See xcomp/erl-xcomp.conf.template
# for documentation.
ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)

ERLANG_CONF_OPT = --without-javac
HOST_ERLANG_CONF_OPT = --without-javac

ifeq ($(BR2_PACKAGE_NCURSES),y)
ERLANG_CONF_OPT += --with-termcap
ERLANG_DEPENDENCIES += ncurses
else
ERLANG_CONF_OPT += --without-termcap
endif

ifeq ($(BR2_PACKAGE_OPENSSL),y)
ERLANG_CONF_OPT += --with-ssl
ERLANG_DEPENDENCIES += openssl
else
ERLANG_CONF_OPT += --without-ssl
endif

ifeq ($(BR2_PACKAGE_ZLIB),y)
ERLANG_CONF_OPT += --enable-shared-zlib
ERLANG_DEPENDENCIES += zlib
endif

# Remove source, example, gs and wx files from the target
ERLANG_REMOVE_PACKAGES = gs wx

ifneq ($(BR2_PACKAGE_ERLANG_MEGACO),y)
ERLANG_REMOVE_PACKAGES += megaco
endif

define ERLANG_REMOVE_STAGING_UNUSED
	# Remove intermediate build products from being copied around
	# by Erlang release tools
	find $(STAGING_DIR)/usr/lib/erlang -type d -name obj -prune -exec rm -rf {} \;

	# Don't expose packages that won't be available on the target
	for package in $(ERLANG_REMOVE_PACKAGES); do \
		rm -rf $(STAGING_DIR)/usr/lib/erlang/lib/$${package}-*; \
	done
endef

define ERLANG_REMOVE_TARGET_UNUSED
	# Remove top level installation and header files
	rm -rf $(TARGET_DIR)/usr/lib/erlang/misc
	rm -f $(TARGET_DIR)/usr/lib/erlang/Install
	rm -rf $(TARGET_DIR)/usr/lib/erlang/usr/include

	# Remove intermediate build products
	find $(TARGET_DIR)/usr/lib/erlang -type d -name obj -prune -exec rm -rf {} \;

	# Remove package and erts files that are not needed
	# at runtime
	for dir in $(TARGET_DIR)/usr/lib/erlang/erts-* \
		   $(TARGET_DIR)/usr/lib/erlang/lib/*; do \
		rm -rf $${dir}/src $${dir}/c_src $${dir}/include $${dir}/doc \
		       $${dir}/man $${dir}/examples $${dir}/emacs; \
	done

	# Remove unwanted packages
	for package in $(ERLANG_REMOVE_PACKAGES); do \
		rm -rf $(TARGET_DIR)/usr/lib/erlang/lib/$${package}-*; \
	done
endef

ERLANG_POST_INSTALL_STAGING_HOOKS += ERLANG_REMOVE_STAGING_UNUSED
ERLANG_POST_INSTALL_TARGET_HOOKS += ERLANG_REMOVE_TARGET_UNUSED

$(eval $(autotools-package))
$(eval $(host-autotools-package))
