# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft

DESCRIPTION="Sidebar for LeechCraft supporting quarks like tab switcher, tray area and so on"

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	dev-qt/qtbase:6[widgets]
	dev-qt/qtdeclarative:6[widgets]
"
RDEPEND="${DEPEND}"
