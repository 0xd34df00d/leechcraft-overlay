# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit leechcraft

DESCRIPTION="An issue reporting client for LeechCraft's issue tracker"

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	dev-qt/qtbase:6[network,ssl,widgets,xml]
"
RDEPEND="${DEPEND}"
