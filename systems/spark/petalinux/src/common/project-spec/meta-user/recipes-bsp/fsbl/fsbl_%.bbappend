SRC_URI:append += " \
		file://fsbl_hooks.patch \
		"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Note: This is not required if you are using Yocto
# CAUTION!: EXTERNALXSCTSRC and EXTERNALXSCTSRC_BUILD is required only for 2018.2 and below petalinux releases
EXTERNALXSCTSRC = ""
EXTERNALXSCTSRC_BUILD = ""
