// ================================== CONSTANTS ===================================
#define SNAKECOUNT 5
#define COINCOUNT 5
#define ROCKETCOUNT 2


// ================================== SPRITES ===================================

// SPRITE STATE OF PLAYER
enum {FRONT, BACK, RIGHT, LEFT, IDLE};

// SPRITE STATE OF SNAKES
enum {BADDIE};

// ================================== PROTOTYPES ===================================
void updateGame();
void drawGame();
void initGame();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void initPlayer();
void updateSnakes();
void drawSnakes();
void initSnakes();
void spawnSnakes();
void initRockets();
void updateRockets();
void drawRockets();
void spawnRockets();
void initCoins();
void updateCoins();
void drawCoins();
void spawnCoins();
void drawScore();
void drawLives();