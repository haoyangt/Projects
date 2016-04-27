#include "SplashScene.h"
#include <iostream>
bool Splash::init(){
	if(!Layer::init())
		return false;

	//显示名称
	auto labelName=Label::createWithTTF("2048", "fonts/Abduction.ttf", FONT_LARGE);
	labelName->setPosition(Point(GAME_SCREEN_WIDTH/2,GAME_SCREEN_HEIGHT/2));
	labelName->setColor(Color3B(200,200,255));
	this->addChild(labelName);
	//显示制作人
	auto labelDirector=Label::createWithTTF("CREATED BY HaoyangTian", "fonts/Abduction.ttf", FONT_SMALL);
	labelDirector->setPosition(Point(GAME_SCREEN_WIDTH*3/5,GAME_SCREEN_HEIGHT/4));
	labelDirector->setColor(Color3B(238,149,114));
	this->addChild(labelDirector);
	//计划任务，3秒后自动跳转到GameScene
	this->scheduleOnce(schedule_selector(Splash::jumpToGame),2);
	return true;
}

Scene* Splash::createScene(){
	auto scene=Scene::create();
	auto layer=Splash::create();
	scene->addChild(layer);
	return scene;
}

void Splash::jumpToGame(float t){
	CocosDenshion::SimpleAudioEngine::getInstance()->preloadEffect("move.wav");
	CocosDenshion::SimpleAudioEngine::getInstance()->preloadEffect("merge.wav");
	CocosDenshion::SimpleAudioEngine::getInstance()->preloadEffect("fail.wav");
	auto scene=Game::createScene();
	Director::getInstance()->replaceScene(TransitionProgressOutIn::create(0.5, scene));
}


