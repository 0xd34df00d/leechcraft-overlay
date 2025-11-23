# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft

DESCRIPTION="VKontakte music source plugin for LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	dev-qt/qtbase:6[concurrent,network,widgets,xml]
"
RDEPEND="${DEPEND}"
