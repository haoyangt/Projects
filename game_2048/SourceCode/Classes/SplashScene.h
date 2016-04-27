#include <iostream>
#include "cocos2d.h"
#include "gamedefine.h"
#include "GameScene.h"
#include "SimpleAudioEngine.h"
USING_NS_CC;
class Splash:Layer
{
	bool init();
	void jumpToGame(float t);
	
public:
	CREATE_FUNC(Splash);
	static Scene* createScene();
};

