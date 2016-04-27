#include <iostream>
#include "GameWinScene.h"
#include "GameScene.h"

bool GameWin::init(){
	if(!Layer::init())
		return false;
	//定义背景
	auto sprite = Sprite::create("background2.jpg");
	//float windowWidth=Director::getInstance()->getWinSize().width;
	//float windowHeight=Director::getInstance()->getWinSize().height;
	float imgWidth=sprite->getTextureRect().getMaxX();
	float imgHeight=sprite->getTextureRect().getMaxY();
	sprite->setScaleX(GAME_SCREEN_WIDTH/imgWidth);
	sprite->setScaleY(GAME_SCREEN_HEIGHT/imgHeight);
	sprite->setPosition(GAME_SCREEN_WIDTH/2,GAME_SCREEN_HEIGHT/2);
	this->addChild(sprite, 0);
	//定义标题
	auto labelTitle=Label::createWithTTF("CONGRATULATION~", "fonts/showg.ttf", FONT_MIDDLE);
	labelTitle->setPosition(Point(GAME_SCREEN_WIDTH/2,GAME_SCREEN_HEIGHT/4));
	labelTitle->setColor(Color3B(238,149,114));
	this->addChild(labelTitle);
	//定义restart
	auto labelRestart=Label::createWithTTF("Restart", "fonts/arial.ttf", FONT_SMALL);
	labelRestart->setColor(Color3B(238,149,114));
	auto menuItemLabel=MenuItemLabel::create(labelRestart,CC_CALLBACK_1(GameWin::restart,this));
	menuItemLabel->setPosition(Point(GAME_SCREEN_WIDTH-labelRestart->getContentSize().width,GAME_SCREEN_HEIGHT/6));
	auto menu=Menu::create(menuItemLabel,NULL);
	menu->setPosition(Point::ZERO);
	this->addChild(menu);

	return true;
}
Scene* GameWin::createScene(){
	Scene* scene=Scene::create();
	Layer* layer=GameWin::create();
	scene->addChild(layer);
	return scene;
}
void GameWin::restart(Ref* object){
	auto scene=Game::createScene();
	Director::getInstance()->replaceScene(scene);
}