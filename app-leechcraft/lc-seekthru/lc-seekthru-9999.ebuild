# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft

DESCRIPTION="OpenSearch support for LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	dev-qt/qtbase:6[widgets,xml]
"
RDEPEND="${DEPEND}
	~virtual/leechcraft-search-show-${PV}
	~virtual/leechcraft-downloader-http-${PV}
"
