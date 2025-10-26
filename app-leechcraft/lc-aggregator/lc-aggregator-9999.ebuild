# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft

DESCRIPTION="Full-featured RSS/Atom feed reader for LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="debug postgres +sqlite"

DEPEND="
	~app-leechcraft/lc-core-${PV}[postgres?]
	dev-qt/qtbase:6[cups,network,sql,widgets,xml]
"
RDEPEND="${DEPEND}
	dev-qt/qtbase:6[postgres?,sqlite?]
	virtual/leechcraft-downloader-http
"

REQUIRED_USE="|| ( sqlite postgres )"
