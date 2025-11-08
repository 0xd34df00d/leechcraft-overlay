# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft

DESCRIPTION="Network monitor plugin for LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	dev-libs/libnl:3
	dev-qt/qtbase:6[network,widgets]
	x11-libs/qwt[qt6]
	"
RDEPEND="${DEPEND}
	~virtual/leechcraft-quark-sideprovider-${PV}"
