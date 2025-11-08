# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg-utils leechcraft

DESCRIPTION="LeechCraft Media Player, Phonon-based audio/video player"

SLOT="0"
KEYWORDS=""
IUSE="debug +fradj +graffiti +mpris +mtp +mp3tunes potorchu"

DEPEND="
	~app-leechcraft/lc-core-${PV}
	dev-qt/qtbase:6[concurrent,network,sql,xml]
	dev-qt/qtdeclarative:6[widgets]
	media-libs/gstreamer:1.0
	media-libs/taglib
	fradj? ( x11-libs/qwt[qt6] )
	mpris? ( dev-qt/qtbase:6[dbus] )
	mtp? ( media-libs/libmtp:= )
	potorchu? ( media-libs/libprojectm:= )
"
RDEPEND="${DEPEND}
	dev-qt/qtbase:6[sqlite]
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
