# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft

DESCRIPTION="LeechCraft Package Manager for extensions, scripts, themes etc"

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	dev-qt/qtbase:6[network,sql,widgets,xml]
"
RDEPEND="${DEPEND}
	dev-qt/qtbase:6[sqlite]
	~virtual/leechcraft-downloader-http-${PV}
"
