# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft

DESCRIPTION="Allows launching external applications (and LeechCraft plugins) from LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	dev-qt/qtdeclarative:6[widgets]
"
RDEPEND="${DEPEND}
	~virtual/leechcraft-trayarea-${PV}"
