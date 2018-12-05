
/*  N O T E S ! ! !
======================================================================
FINISHED
    - state machine
    - menu screens set up
    - player sprite animated
    - enemies spawning
    - multiple enemy types
TODO
    - create animation for each of the menu screens
BUGS
    - game background is not showing up - the previous screen shows instead
GAMEPLAY
    - you can play this game by dodging each of the monsters
    - hit three monsters and you die
    - controls:
        UP = move up one lane
        DOWN = move down one lane
        LEFT = run left
        RIGHT = run right
======================================================================
*/

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "sound.h"
#include "spritesheet.h"
#include "foreground.h"
#include "background.h"
#include "holder.h"
#include "instructions.h"
#include "start.h"
#include "pause.h"
#include "lose.h"
#include "bg.h"
#include "thud.h"
#include "rupee.h"
#include "hiss.h"

// Prototypes
void initialize();
void drawFinalScore();

// State Prototypes
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToLose();
void lose();

// States
int state;
enum {START, GAME, INSTRUCTIONS, PAUSE, LOSE};

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Offset Variables
int hOff = 0;
int vOff = 0;

// ShadowOAM
OBJ_ATTR shadowOAM[128];

// Random Seed
unsigned int seed;

// Text Buffer
char buffer[41];

// Other Variables
extern int lives;
extern int score;
extern int cheat;
extern int sauce;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
        }

        DMANow(3, shadowOAM, OAM, 128*4);
    }
}

void initialize() {
	//set up buttons, horizontal offset, and mode 0/backgrounds on register
    
    setupSounds();
    setupInterrupts();

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    // PALETTE 
    DMANow(3, startPal, PALETTE, startPalLen/2);

    // BACKGROUND
    REG_BG1CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(29);

    // FOREGROUND (and also menu screens)
    REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(2) | BG_SCREENBLOCK(30);

    buttons = BUTTONS;
    hOff = 0;

    goToStart();

}

void goToStart() {
    DMANow(3, startTiles, &CHARBLOCK[2], startTilesLen/2);
    DMANow(3, startMap, &SCREENBLOCK[30], startMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;

    stopSound();
    playSoundA(bg,BGLEN,BGFREQ, 1);

    // Reset Registers
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    waitForVBlank();

    hideSprites();

    DMANow(3, shadowOAM, OAM, 120*4);

    seed = 0;
	state = START;
}

void start() {
	seed++;
	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START)) {
	    srand(seed);
        goToGame();
        initGame();
	}

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
}

void goToInstructions() {

    // Reset Registers
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    // waitForVBlank();

    DMANow(3, instructionsTiles, &CHARBLOCK[2], instructionsTilesLen/2);
    DMANow(3, instructionsMap, &SCREENBLOCK[30], instructionsMapLen);

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    state = INSTRUCTIONS;
}

void instructions() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame();
    }
}

void goToGame() {

    // BACKGROUND
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen/2);
    DMANow(3, backgroundMap, &SCREENBLOCK[29], backgroundMapLen/2);

    // FOREGROUND
    DMANow(3, foregroundTiles, &CHARBLOCK[2], foregroundTilesLen/2);
    DMANow(3, foregroundMap, &SCREENBLOCK[30], foregroundMapLen/2);

    // SPRITESHEET
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE |  BG1_ENABLE | SPRITE_ENABLE;

    waitForVBlank();

    hideSprites();

    DMANow(3, shadowOAM, OAM, 120*4);

	state = GAME;
}

void game() {

	drawGame();
	waitForVBlank();
	updateGame();

    // Pausing state
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    // Losing state
    if (lives == 0) {
        goToLose();
    }

    // update OAM
    DMANow(3, shadowOAM, OAM, 120*4);
}

void goToPause() {
    // Reset Registers
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    waitForVBlank();

    hideSprites();

    DMANow(3, pauseTiles, &CHARBLOCK[2], pauseTilesLen/2);
    DMANow(3, pauseMap, &SCREENBLOCK[30], pauseMapLen/2);

    state = PAUSE;
}

void pause() {
	if (BUTTON_PRESSED(BUTTON_START)) {
	    goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
	    goToStart();
    }
}

void goToLose() {
    // Reset Registers
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    DMANow(3, loseTiles, &CHARBLOCK[2], loseTilesLen/2);
    DMANow(3, loseMap, &SCREENBLOCK[30], loseMapLen/2);

    waitForVBlank();

    hideSprites();

    state = LOSE;

}

void lose() {
	if (BUTTON_PRESSED(BUTTON_START)) {
	    goToStart();
    }
}
