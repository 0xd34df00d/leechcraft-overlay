# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils leechcraft

DESCRIPTION="LeechCraft Media Player, Phonon-based audio/video player"

SLOT="0"
KEYWORDS=""
IUSE="debug +fradj +graffiti +mpris +mtp +mp3tunes potorchu"

DEPEND="
	~app-leechcraft/lc-core-${PV}
	dev-qt/qtconcurrent:5
	dev-qt/qtdeclarative:5[widgets]
	dev-qt/qtnetwork:5
	dev-qt/qtsql:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	media-libs/gstreamer:1.0
	media-libs/taglib
	fradj? ( x11-libs/qwt:6 )
	mpris? ( dev-qt/qtdbus:5 )
	mtp? ( media-libs/libmtp:= )
	potorchu? ( media-libs/libprojectm:= )
"
RDEPEND="${DEPEND}
	dev-qt/qtsql:5[sqlite]
	graffiti? ( media-libs/flac )
	mtp? ( ~app-leechcraft/lc-devmon-${PV} )
"

src_configure() {
	local mycmakeargs=(
		-DENABLE_LMP_LIBGUESS=OFF
		-DENABLE_LMP_FRADJ=$(usex fradj)
		-DENABLE_LMP_GRAFFITI=$(usex graffiti)
		-DENABLE_LMP_MP3TUNES=$(usex mp3tunes)
		-DENABLE_LMP_MPRIS=$(usex mpris)
		-DENABLE_LMP_MTPSYNC=$(usex mtp)
		-DENABLE_LMP_POTORCHU=$(usex potorchu)
	)
	cmake_src_configure
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
