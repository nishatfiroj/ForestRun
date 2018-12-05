void initialize() {
	//set up buttons, horizontal offset, and mode 0/backgrounds on register
    buttons = BUTTONS;
    hOff = 0;

    //Higher priorities come first to be covered by later sprites and backgrounds
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(10); // MENUS and FOREGROUND
    REG_BG1CNT = BG_SIZE_WIDE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(20); // BACKGROUND
    // REG_BG3CNT = BG_SIZE_SMALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(16); // BACKGROUND

    // PALETTE 
    DMANow(3, startPal, PALETTE, startPalLen/2);

    // FOREGROUND
    DMANow(3, foregroundTiles, &CHARBLOCK[1], foregroundTilesLen/2);
    DMANow(3, foregroundMap, &SCREENBLOCK[10], foregroundMapLen/2);

    // BACKGROUND
    DMANow(3, backgroundTiles, &CHARBLOCK[1], backgroundTilesLen/2);
    DMANow(3, backgroundMap, &SCREENBLOCK[20], backgroundMapLen/2);

    // SPRITESHEET
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    hideSprites();

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    goToStart();

}

void goToGame() {

    // DMANow(3, backgroundTiles, &CHARBLOCK[3], backgroundTilesLen/2);
    // DMANow(3, backgroundMap, &SCREENBLOCK[16], backgroundMapLen/2);

    // DMANow(3, foregroundTiles, &CHARBLOCK[1], foregroundTilesLen/2);
    // DMANow(3, foregroundMap, &SCREENBLOCK[20], foregroundMapLen/2);

    // DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    // DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE |  BG1_ENABLE | SPRITE_ENABLE;

    waitForVBlank();

    hideSprites();

    DMANow(3, shadowOAM, OAM, 120*4);

    state = GAME;
}
