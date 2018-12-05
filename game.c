#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "background.h"
#include "foreground.h"
#include "collisionmap.h"
#include "sound.h"
#include "thud.h"
#include "hiss.h"
#include "rupee.h"


// Variables
ANISPRITE player;
OBJ_ATTR shadowOAM[128];
ANISPRITE player;
ANISPRITE snakes[SNAKECOUNT];
ANISPRITE rockets[ROCKETCOUNT];
ANISPRITE coins[COINCOUNT];
SOUND soundA;
SOUND soundB;
int score;

// Offset Variables
int hOff;
int vOff;

// Other Variables
int lives;
int cheat;
int sauce;

void initGame() {
    hOff = 20;
    vOff = 100;
    lives = 3;
    cheat = 0;
    sauce = 0;


    initPlayer();
    initSnakes();
    initRockets();
    initCoins();
    spawnSnakes(SNAKECOUNT);
    spawnRockets(ROCKETCOUNT);
    spawnCoins(COINCOUNT);
}

void updateGame() {
	updatePlayer();
	updateSnakes();
	updateRockets();
	updateCoins();
	DMANow(3, shadowOAM, OAM, 128*4);
}

void drawGame() {
	drawPlayer();
	drawSnakes();
	drawRockets();
	drawCoins();
	drawScore();
	drawLives();
}

// ================================== PLAYER ===================================

// Initialize the player
void initPlayer() {
    player.width = 16;
    player.height = 16;
    player.rdel = 20;
    player.cdel = 0;
    player.row = 70;
    player.col = 20;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = FRONT;
}

// Handle every-frame actions of the player
void updatePlayer() {

	// set the player's row as either the first, second, third, or fourth row

	if (player.aniState != IDLE) {
		player.prevAniState = player.aniState;
	}
	player.aniState = IDLE;

    // Change the animation frame every 20 frames of gameplay
	if(player.aniCounter % 20 == 0) {
		if (player.curFrame == 0) {
            player.curFrame = 1;
        } else if (player.curFrame == 1) {
            player.curFrame = 2;
        } else if (player.curFrame == 2) {
            player.curFrame = 0;
        }
	}
	
    // Control movement and change animation state
	if(BUTTON_PRESSED(BUTTON_UP) && player.row > 70) { // at 60, the player's feet are still on the pathway, think about making this bound bigger when u got gravity working so the player can jump and therefore go above this level
		player.aniState = BACK;
		player.rdel = -20;
		player.row += player.rdel;
	} else if(BUTTON_PRESSED(BUTTON_DOWN) && player.row < 130) {
		player.aniState = FRONT;
		player.rdel = 20;
		player.row += player.rdel;
	} else {
		player.aniState = RIGHT;
		player.cdel = 3;
		hOff++;
	}

	// Activate cheat
	if (BUTTON_PRESSED(BUTTON_A)) {
		cheat = 1;
	}

	// Activate sauce
	if (BUTTON_PRESSED(BUTTON_B)) {
		sauce = 1;
	}

	if (player.aniState == IDLE) {
		player.curFrame = 0;
		player.aniState = player.prevAniState;
	}



    REG_BG1HOFF = 2 * hOff;
    REG_BG0HOFF = hOff;

	player.aniCounter++;

}

// Draw the player
void drawPlayer() {
	if (cheat == 0) {
	    shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	    shadowOAM[0].attr1 = player.col | ATTR1_SMALL;
	    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2 * player.curFrame, 2 * player.aniState);
	}

	if (sauce == 1) { 
		shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	    shadowOAM[0].attr1 = player.col | ATTR1_SMALL;
	    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2 * player.curFrame, 2 * player.aniState);
	} 

	if (cheat == 1) {
		shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	    shadowOAM[0].attr1 = player.col | ATTR1_SMALL;
	    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2 * player.curFrame, 8);
	}
}


// ================================== ENEMIES ===================================

// Initialize the player
void initSnakes() {
	for (int i = 0; i < SNAKECOUNT; i++) {
		snakes[i].row = 70;
	    snakes[i].col = 240;
	    snakes[i].active = 0;
		snakes[i].width = 16;
	    snakes[i].height = 16;
		snakes[i].aniCounter = 0;
	    snakes[i].curFrame = 0;
	    snakes[i].numFrames = 1;
	    snakes[i].cdel = 1;
	    snakes[i].hide = 0;
	}
}

// Handle every-frame actions of the player
void updateSnakes() {

	int numSnakes = SNAKECOUNT;

	for (int i = 0; i < numSnakes; i++) {

		// if enemy is currently not hidden
		if (!snakes[i].hide) {

			// moving the snakes FORWARD
			if (snakes[i].aniCounter % 5) {
				snakes[i].col -= snakes[i].cdel;
			}

			if(snakes[i].aniCounter % 20 == 0) {
				snakes[i].aniState++;
				if (snakes[i].aniState == 0) {
					snakes[i].aniState = 1;
				} else if (snakes[i].aniState == 4) {
		            snakes[i].aniState = 0;
		        }
			}

			// if there is a collision between snakes and player when cheat is activated
			if (cheat == 0) {
			    if (collision(snakes[i].row, snakes[i].col, snakes[i].width, snakes[i].height, 
					player.row, player.col, player.width, player.height)) {
					snakes[i].hide = 1;
					snakes[i].active = 0;
					numSnakes--;
					lives--;

	    			playSoundB(hiss,HISSLEN,HISSFREQ, 0);

				// if snakes go off the page deactivate and hide enemy
				} else if (snakes[i].col <= 0) {
					snakes[i].hide = 1;
					snakes[i].active = 0;
					numSnakes--;
				}


			// if there is a collision between snakes and player when cheat is activated
			} else if (cheat == 1) {
				if (collision(snakes[i].row, snakes[i].col, snakes[i].width, snakes[i].height, 
					player.row, player.col, player.width, player.height)) {
					snakes[i].hide = 1;
					snakes[i].active = 0;
					numSnakes--;

				// if snakes go off the page deactivate and hide enemy
				} else if (snakes[i].col <= 0) {
					snakes[i].hide = 1;
					snakes[i].active = 0;
					numSnakes--;
				}
			}
		}

		// once an enemy is inactive we can spawn them again
		if (!snakes[i].active || snakes[i].hide) {
			spawnSnakes(numSnakes);
		}

		snakes[i].aniCounter++;
	}
}

// Spawn snakes as soon as the player hits one or as soon as the enemy goes off screen
void spawnSnakes(int numSnakes) {
	for (int i = 0; i < numSnakes; i++) {
		if (!snakes[i].active || snakes[i].hide) {
			snakes[i].row = (rand() % 5)*20 + 70;
			if (snakes[i].row > 130) {
				snakes[i].row = 70;
			}
			snakes[i].col = (rand() % 240)+ 240;
			snakes[i].active = 1;
			snakes[i].hide = 0;
			snakes[i].curFrame = 0;
			snakes[i].aniCounter = 0;
		}
	}
}

// Draw the snakes
void drawSnakes() {
    for (int i = 0; i < SNAKECOUNT; i++) {
    	if (snakes[i].hide == 0) {
			shadowOAM[i + 10].attr0 = snakes[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
			shadowOAM[i + 10].attr1 = snakes[i].col | ATTR1_SMALL;
			shadowOAM[i + 10].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(6, 2 * snakes[i].aniState);
		} else if (snakes[i].hide) {
			shadowOAM[i + 10].attr0 = ATTR0_HIDE;
		}
	}
}

// ================================== ROCKETS ===================================

// Initialize the player
void initRockets() {
	for (int i = 0; i < ROCKETCOUNT; i++) {
		rockets[i].row = 70;
	    rockets[i].col = 240;
	    rockets[i].active = 0;
		rockets[i].width = 16;
	    rockets[i].height = 16;
		rockets[i].aniCounter = 0;
	    rockets[i].curFrame = 0;
	    rockets[i].numFrames = 1;
	    rockets[i].cdel = 3;
	    rockets[i].hide = 0;
	}
}

// Handle every-frame actions of the player
void updateRockets() {

	int numRockets = ROCKETCOUNT;

	for (int i = 0; i < numRockets; i++) {

		// if enemy is currently not hidden
		if (!rockets[i].hide) {

			// moving the rockets side to side
			if (rockets[i].aniCounter % 5) {
				rockets[i].col -= rockets[i].cdel;
			}

			// if there is a collision between rockets and player and cheat is off 
			if (cheat == 0) {
			    if (collision(rockets[i].row, rockets[i].col, rockets[i].width, rockets[i].height, 
					player.row, player.col, player.width, player.height)) {
					rockets[i].hide = 1;
					rockets[i].active = 0;
					numRockets--;
					lives--;

	    			playSoundB(thud,THUDLEN,THUDFREQ, 0);
					// stopSound();

				// if rockets go off the page deactivate and hide enemy
				} else if (rockets[i].col <= 0) {
					rockets[i].hide = 1;
					rockets[i].active = 0;
					numRockets--;
				}


			// if there is a collision between rockets and player and cheat is on 
			} else if (cheat) {
				if (collision(rockets[i].row, rockets[i].col, rockets[i].width, rockets[i].height, 
					player.row, player.col, player.width, player.height)) {
					rockets[i].hide = 1;
					rockets[i].active = 0;
					numRockets--;

				// if rockets go off the page deactivate and hide enemy
				} else if (rockets[i].col <= 0) {
					rockets[i].hide = 1;
					rockets[i].active = 0;
					numRockets--;
				}
			}
		}

		// once an enemy is inactive we can spawn them again
		if (!rockets[i].active || rockets[i].hide) {
			spawnRockets(numRockets);
		}

		rockets[i].aniCounter++;
	}
}

// Spawn rockets as soon as the player hits one or as soon as the enemy goes off screen
void spawnRockets(int numRockets) {
	for (int i = 0; i < numRockets; i++) {
		if (!rockets[i].active || rockets[i].hide) {
			rockets[i].row = (rand() % 5)*20 + 70;
			rockets[i].col = (rand() % 240)+ 240;
			rockets[i].active = 1;
			rockets[i].hide = 0;
			rockets[i].curFrame = 0;
			rockets[i].aniCounter = 0;
			rockets[i].aniState = rand() % 3;
		}
	}
}

// Draw the rockets
void drawRockets() {
    for (int i = 0; i < ROCKETCOUNT; i++) {
    	if (rockets[i].hide == 0) {
			shadowOAM[i + 20].attr0 = rockets[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
			shadowOAM[i + 20].attr1 = rockets[i].col | ATTR1_SMALL;
			shadowOAM[i + 20].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(8, 2 * rockets[i].aniState);
		} else if (rockets[i].hide) {
			shadowOAM[i + 20].attr0 = ATTR0_HIDE;
		}
	}
}

// ================================== COINS ===================================

// Initialize the player
void initCoins() {
	for (int i = 0; i < COINCOUNT; i++) {
		coins[i].row = 70;
	    coins[i].col = 240;
	    coins[i].active = 0;
		coins[i].width = 16;
	    coins[i].height = 16;
		coins[i].aniCounter = 0;
	    coins[i].curFrame = 0;
	    coins[i].numFrames = 1;
	    coins[i].cdel = 1;
	    coins[i].hide = 0;
	}
}

// Handle every-frame actions of the player
void updateCoins() {

	int numCoins = COINCOUNT;

	for (int i = 0; i < numCoins; i++) {

		// if enemy is currently not hidden
		if (!coins[i].hide) {

			// moving the coins side to side
			if (coins[i].aniCounter % 5) {
				coins[i].col -= coins[i].cdel;
			}

			// animate the coin
			if(coins[i].aniCounter % 20 == 0) {
				coins[i].aniState++;
				if (coins[i].aniState == 0) {
					coins[i].aniState = 1;
				} else if (coins[i].aniState == 7) {
		            coins[i].aniState = 0;
		        }
			}


			// if there is a collision between coins and player
		    if (collision(coins[i].row, coins[i].col, coins[i].width, coins[i].height, 
				player.row, player.col, player.width, player.height)) {
				coins[i].hide = 1;
				coins[i].active = 0;
				numCoins--;
				score++;
	    		playSoundB(rupee,RUPEELEN,RUPEEFREQ, 0);


			// if coins go off the page deactivate and hide enemy
			} else if (coins[i].col <= 0) {
				coins[i].hide = 1;
				coins[i].active = 0;
				numCoins--;
			}

			// once a coin is inactive we can spawn them again
			if (!coins[i].active || coins[i].hide) {
				spawnCoins(numCoins);
			}

			coins[i].aniCounter++;
		}
	}
}

// Spawn coins as soon as the player hits one or as soon as the enemy goes off screen
void spawnCoins(int numCoins) {
	for (int i = 0; i < numCoins; i++) {
		if (!coins[i].active || coins[i].hide) {
			coins[i].row = (rand() % 5)*20 + 70;
			coins[i].col = (rand() % 240)+ 240;
			coins[i].active = 1;
			coins[i].hide = 0;
			coins[i].curFrame = 0;
			coins[i].aniCounter = 0;
		}
	}
}

// Draw the coins
void drawCoins() {
    for (int i = 0; i < COINCOUNT; i++) {
    	if (coins[i].hide == 0) {
			shadowOAM[i + 30].attr0 = coins[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
			shadowOAM[i + 30].attr1 = coins[i].col | ATTR1_SMALL;
			shadowOAM[i + 30].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(10, 2 * coins[i].aniState);
		} else if (coins[i].hide) {
			shadowOAM[i + 30].attr0 = ATTR0_HIDE;
		}
	}
}

// ================================== SCORE ===================================

// Draw the coins
void drawScore() {

	// NUMBER OF DIGITS
	int numDigits = 1; 			// DEFAULT
	if (score > 9)				// CHECK FOR MORE
		numDigits = 2;
	if (score > 99)
		numDigits = 3;
	if (score > 999)
		numDigits = 4;
	if (score > 9999)
		numDigits = 5;

	// DIGITS
    int firstDigit = score % 10;
    int secondDigit = (score / 10) % 10;
    int thirdDigit = (score / 100) % 10;
    int fourthDigit = (score / 1000) % 10;
    int fifthDigit = (score / 10000) % 10;

    // FIRST DIGIT
    shadowOAM[40].attr0 = 2 | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[40].attr1 = 220 | ATTR1_SMALL;
    shadowOAM[40].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(12, firstDigit * 2);

	if (numDigits >= 2) {	
	    // SECOND DIGIT
	    shadowOAM[41].attr0 = 2 | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	    shadowOAM[41].attr1 = 210 | ATTR1_SMALL;
	    shadowOAM[41].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(12, secondDigit * 2);
	}

	if (numDigits >= 3) {
	    // THIRD DIGIT
	    shadowOAM[42].attr0 = 2 | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	    shadowOAM[42].attr1 = 200 | ATTR1_SMALL;
	    shadowOAM[42].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(12, thirdDigit * 2);
	}

	if (numDigits >= 4) {
	    // FOURTH DIGIT
	    shadowOAM[43].attr0 = 2 | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	    shadowOAM[43].attr1 = 190 | ATTR1_SMALL;
	    shadowOAM[43].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(12, fourthDigit * 2);
	}

	if (numDigits >= 5) {
	    // FIFTH DIGIT
	    shadowOAM[44].attr0 = 2 | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	    shadowOAM[44].attr1 = 180 | ATTR1_SMALL;
	    shadowOAM[44].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(12, fifthDigit * 2);
	}
}

// ================================== LIVES ===================================

void drawLives() {
	for (int i = 0; i < lives; i++) {
		shadowOAM[45 + i].attr0 = 2 | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	    shadowOAM[45 + i].attr1 = (lives + (i * 20)) | ATTR1_SMALL;
	    shadowOAM[45 + i].attr2 = ATTR2_PALROW(4) | ATTR2_PRIORITY(0) | ATTR2_TILEID(14, 0);
	}
	
	if (lives == 2) {
		shadowOAM[47].attr0 = ATTR0_HIDE;
	} else if (lives == 1) {
		shadowOAM[46].attr0 = ATTR0_HIDE;

	}
}