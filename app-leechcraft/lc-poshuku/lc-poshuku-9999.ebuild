# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft

DESCRIPTION="Poshuku, the full-featured web browser plugin for LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="+autosearch debug +dcac +cleanweb +fatape +filescheme +fua +idn +keywords +onlinebookmarks
postgres qrd +speeddial +sqlite +webengine"

DEPEND="~app-leechcraft/lc-core-${PV}[postgres?]
	dev-qt/qtbase:6[cups,network,sql,widgets,xml]
	cleanweb? ( dev-qt/qtbase:6[concurrent] )
	idn? ( net-dns/libidn:= )
	qrd? ( media-gfx/qrencode:= )
	webengine? ( dev-qt/qtwebengine:6 )
"
RDEPEND="${DEPEND}
	dev-qt/qtbase:6[postgres?,sqlite?]
	virtual/leechcraft-downloader-http
"

REQUIRED_USE="|| ( postgres sqlite )"

src_configure() {
	local mycmakeargs=(
		-DENABLE_POSHUKU_AUTOSEARCH=$(usex autosearch)
		-DENABLE_POSHUKU_CLEANWEB=$(usex cleanweb)
		-DENABLE_POSHUKU_DCAC=$(usex dcac)
		-DENABLE_POSHUKU_FATAPE=$(usex fatape)
		-DENABLE_POSHUKU_FILESCHEME=$(usex filescheme)
		-DENABLE_POSHUKU_FUA=$(usex fua)
		-DENABLE_IDN=$(usex idn)
		-DENABLE_POSHUKU_KEYWORDS=$(usex keywords)
		-DENABLE_POSHUKU_ONLINEBOOKMARKS=$(usex onlinebookmarks)
		-DENABLE_POSHUKU_QRD=$(usex qrd)
		-DENABLE_POSHUKU_SPEEDDIAL=$(usex speeddial)
		-DENABLE_POSHUKU_WEBENGINEVIEW=$(usex webengine)
	)

	cmake_src_configure
}
