# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft

DESCRIPTION="LeechCraft HTML Text editoR component"

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	app-text/htmltidy
	dev-qt/qtbase:6[network]
	dev-qt/qtwebengine:6[widgets]
"
RDEPEND="${DEPEND}"
