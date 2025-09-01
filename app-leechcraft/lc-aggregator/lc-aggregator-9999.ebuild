# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit leechcraft

DESCRIPTION="Full-featured RSS/Atom feed reader for LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="debug postgres +sqlite"

DEPEND="
	~app-leechcraft/lc-core-${PV}[postgres?]
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtsql:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5"
RDEPEND="${DEPEND}
	dev-qt/qtsql:5[postgres?,sqlite?]
	virtual/leechcraft-downloader-http
"

REQUIRED_USE="|| ( sqlite postgres )"
