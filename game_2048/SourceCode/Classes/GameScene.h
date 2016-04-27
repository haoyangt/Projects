#include <iostream>
#include "cocos2d.h"
#include "gamedefine.h"
#include "MovableTile.h"
#include "SimpleAudioEngine.h"
USING_NS_CC;
class Game:Layer
{
private:
	LayerColor* gameArea;
	bool m_startMove;
	bool m_play_sound_merge;
	bool win;
	bool haveMoved;
	int map[GAME_ROWS][GAME_COLS];
	int score;
	Vector<MovableTile *> tiles;
	std::vector<std::vector<int> >history;
	int backCount;
	int from_x,from_y,to_x,to_y;
	E_MOVE_DIR m_dir;
	void moveAll(E_MOVE_DIR dir);
	void moveLeft();
	void moveRight();
	void moveUp();
	void moveDown();
	void createNewTile();
	bool init();
	void restart(Ref* object);
	void back(Ref* object);
public:
	CREATE_FUNC(Game);
	static Scene* createScene();
};