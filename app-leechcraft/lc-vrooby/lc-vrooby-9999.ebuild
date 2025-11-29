# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft

DESCRIPTION="Vrooby, removable device manager for LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	dev-qt/qtbase:6[dbus]
	dev-qt/qtdeclarative:6[widgets]
"
RDEPEND="${DEPEND}
	sys-fs/udisks:2"

src_configure() {
	local mycmakeargs=(
		-DENABLE_VROOBY_UDISKS=OFF
		-DENABLE_VROOBY_UDISKS2=ON
	)
	cmake_src_configure
}
