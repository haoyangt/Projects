#include <iostream>
#include "cocos2d.h"
#include "gamedefine.h"
USING_NS_CC;
class GameWin:Layer{
	bool init();
public:
	void restart(Ref* object);
	static Scene* createScene();
	CREATE_FUNC(GameWin);
};