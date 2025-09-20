# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils leechcraft

DESCRIPTION="Azoth, the modular IM client for LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="debug doc +abbrev +acetamide +adiumstyles +autoidler +autopaste +birthdaynotifier
	+chathistory +crypt +depester +embedmedia +herbicide +hili +isterique
	+keeso +lastseen +latex +metacontacts +murm +nativeemoticons +otroid sarin
	shx +spell +standardstyles +tracolor velvetbird +woodpecker +xmpp +xtazy"

REQUIRED_USE="|| ( standardstyles adiumstyles )"

COMMON_DEPEND="
	~app-leechcraft/lc-core-${PV}
	dev-qt/qtbase:6[concurrent,network,sql,xml]
	dev-qt/qtwebengine:6[widgets]
	autoidler? ( x11-libs/libXScrnSaver )
	crypt? ( app-crypt/qca:2 )
	otroid? ( net-libs/libotr )
	sarin? ( net-libs/tox:= )
	xmpp? ( >=net-libs/qxmpp-1.2.0 )
	xtazy? ( ~app-leechcraft/lc-xtazy-${PV} )
"
DEPEND="${COMMON_DEPEND}
	doc? ( app-text/doxygen[dot] )
"
RDEPEND="${COMMON_DEPEND}
	dev-qt/qtbase:6[sqlite]
	crypt? ( app-crypt/qca:2[gpg] )
	latex? (
		virtual/imagemagick-tools
		virtual/latex-base
	)
	spell? ( ~app-leechcraft/lc-rosenthal-${PV} )
"

src_configure() {
	local mycmakeargs=(
		-DENABLE_CRYPT=$(usex crypt)
		-DWITH_DOCS=$(usex doc)
		-DENABLE_AZOTH_ABBREV=$(usex abbrev)
		-DENABLE_AZOTH_ACETAMIDE=$(usex acetamide)
		-DENABLE_AZOTH_ADIUMSTYLES=$(usex adiumstyles)
		-DENABLE_AZOTH_AUTOIDLER=$(usex autoidler)
		-DENABLE_AZOTH_AUTOPASTE=$(usex autopaste)
		-DENABLE_AZOTH_BIRTHDAYNOTIFIER=$(usex birthdaynotifier)
		-DENABLE_AZOTH_CHATHISTORY=$(usex chathistory)
		-DENABLE_AZOTH_DEPESTER=$(usex depester)
		-DENABLE_AZOTH_EMBEDMEDIA=$(usex embedmedia)
		-DENABLE_AZOTH_HERBICIDE=$(usex herbicide)
		-DENABLE_AZOTH_HILI=$(usex hili)
		-DENABLE_AZOTH_ISTERIQUE=$(usex isterique)
		-DENABLE_AZOTH_KEESO=$(usex keeso)
		-DENABLE_AZOTH_LASTSEEN=$(usex lastseen)
		-DENABLE_AZOTH_METACONTACTS=$(usex metacontacts)
		-DENABLE_AZOTH_MODNOK=$(usex latex)
		-DENABLE_MEDIACALLS=OFF
		-DENABLE_AZOTH_MURM=$(usex murm)
		-DENABLE_AZOTH_NATIVEEMOTICONS=$(usex nativeemoticons)
		-DENABLE_AZOTH_OTROID=$(usex otroid)
		-DENABLE_AZOTH_ROSENTHAL=$(usex spell)
		-DENABLE_AZOTH_SARIN=$(usex sarin)
		-DENABLE_AZOTH_SHX=$(usex shx)
		-DENABLE_AZOTH_STANDARDSTYLES=$(usex standardstyles)
		-DENABLE_AZOTH_TRACOLOR=$(usex tracolor)
		-DENABLE_AZOTH_VELVETBIRD=$(usex velvetbird)
		-DENABLE_AZOTH_XOOX=$(usex xmpp)
		-DENABLE_AZOTH_XTAZY=$(usex xtazy)
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	use doc && dodoc -r "${CMAKE_BUILD_DIR}"/out/html/*
}

pkg_postinst() {
	if use spell; then
		elog "You have enabled the Azoth Rosenthal plugin for"
		elog "spellchecking. It uses Hunspell/Myspell dictionaries,"
		elog "so install the ones for languages you use to enable"
		elog "spellchecking."
	fi

	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
