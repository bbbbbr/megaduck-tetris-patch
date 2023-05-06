SECTION "Graphics and Layouts", ROM0[$323f]

Gfx_MenuScreens:
IF DEF(TARGET_MEGADUCK)
	INCBIN "build_duck/menuScreens.2bpp"
ELSE
    INCBIN "build/menuScreens.2bpp"
ENDC
.end:

Layout_ATypeInGame:
	INCBIN "data/layout_aTypeInGame.bin"

STATIC_ASSERT $4000-@ == BANK_0_END_LEN
Layout_BTypeInGame::
	INCBIN "data/layout_bTypeInGame.bin", 0, $4000-@


SECTION "ROM Bank $001", ROMX[$4000], BANK[$1]

	INCBIN "data/layout_bTypeInGame.bin", BANK_0_END_LEN

Gfx_Ascii::
IF DEF(TARGET_MEGADUCK)
	INCBIN "build_duck/ascii.1bpp"
ELSE
    INCBIN "build/ascii.1bpp"
ENDC
.end::

Gfx_TitleScreen::
IF DEF(TARGET_MEGADUCK)
	INCBIN "build_duck/titleScreen.2bpp"
ELSE
    INCBIN "build/titleScreen.2bpp"
ENDC
.end::

Layout_Copyright::
	INCBIN "data/layout_copyright.bin"

Layout_TitleScreen::
	INCBIN "data/layout_titleScreen.bin"

Layout_GameMusicTypeScreen::
	INCBIN "data/layout_gameMusicTypeScreen.bin"

Layout_ATypeSelectionScreen::
	INCBIN "data/layout_aTypeSelectionScreen.bin"

Layout_BTypeSelectionScreen::
	INCBIN "data/layout_bTypeSelectionScreen.bin"

GameScreenLayout_Dancers::
	INCBIN "data/gameScreenLayout_dancers.bin"

Layout_RocketScene::
	INCBIN "data/layout_rocketScene.bin"

Layout_MarioLuigiScreen::
	INCBIN "data/layout_marioLuigiScreen.bin"

Layout_2PlayerInGame::
	INCBIN "data/layout_2PlayerInGame.bin"

Layout_MarioScore::
	INCBIN "data/layout_marioScore.bin"
	
Layout_BricksAndLuigiScore::
	INCBIN "data/layout_bricksAndLuigiScore.bin"

Gfx_RocketScene::
IF DEF(TARGET_MEGADUCK)
	INCBIN "build_duck/rocketScene.2bpp"
ELSE
    INCBIN "build/rocketScene.2bpp"
ENDC
.end::
