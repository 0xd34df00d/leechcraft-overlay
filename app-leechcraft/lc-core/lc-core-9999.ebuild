# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://github.com/0xd34df00d/leechcraft.git"

inherit leechcraft

DESCRIPTION="Core of LeechCraft, the modular network client"

SLOT="0"
KEYWORDS=""
IUSE="debug doc postgres +qwt"

DEPEND="
	dev-libs/boost:=
	dev-qt/qtbase:6[concurrent,dbus,gui,network,ssl,sql,widgets,xml]
	dev-qt/qtdeclarative:6[widgets]
	qwt? ( x11-libs/qwt:6[qt6] )
"
RDEPEND="${DEPEND}
	dev-qt/qtbase:6[postgres?,sqlite]
	dev-qt/qtsvg:6
	|| (
		kde-frameworks/oxygen-icons
		x11-themes/kfaenza
	)
"
BDEPEND="
	dev-qt/qttools:6[linguist]
	doc? ( app-text/doxygen )
"

src_configure() {
	local mycmakeargs=(
		-DWITH_PLUGINS=False
		-DSKIP_MAN_COMPRESS=True
		-DWITH_DOCS=$(usex doc)
		-DWITH_QWT=$(usex qwt)
	)
	if [[ ${PV} != 9999 ]]; then
		mycmakeargs+=( -DLEECHCRAFT_VERSION=${PV} )
	fi
	cmake_src_configure
}

src_install() {
	cmake_src_install
	use doc && dodoc -r "${CMAKE_BUILD_DIR}/${PN#lc-}"/out/html/*
}
