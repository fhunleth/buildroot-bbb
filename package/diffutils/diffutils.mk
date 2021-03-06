################################################################################
#
# diffutils
#
################################################################################

DIFFUTILS_VERSION = 3.2
DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
DIFFUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)

ifeq ($(BR2_PACKAGE_BUSYBOX),y)
DIFFUTILS_DEPENDENCIES += busybox
endif

$(eval $(autotools-package))
