# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit leechcraft

DESCRIPTION="Blogging client for LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="debug +metida +hestia"

DEPEND="
	~app-leechcraft/lc-core-${PV}
	dev-qt/qtbase:6[cups,sql,xml]
	dev-qt/qtdeclarative:6[widgets]
	metida? ( dev-qt/qtbase:6[network] )
"
RDEPEND="${DEPEND}
	dev-qt/qtbase:6[sqlite]
	virtual/leechcraft-wysiwyg-editor
"

src_configure() {
	local mycmakeargs=(
		-DENABLE_BLOGIQUE_METIDA=$(usex metida)
		-DENABLE_BLOGIQUE_HESTIA=$(usex hestia)
	)

	cmake_src_configure
}
