#include "MovableTile.h"
#include <iostream>
USING_NS_CC;
void MovableTile::moveTo(int r,int c){
	this->m_row=r;
	this->m_col=c;
	this->setPosition(GAME_TILE_WIDTH*r+GAME_TILE_BORDER*(r+1),GAME_TILE_HEIGHT*c+GAME_TILE_BORDER*(c+1));
}
void MovableTile::createNewTile(int r,int c){
	moveTo(r,c);
	//动画效果
	auto bgColor=this->getChildByTag(101);
	bgColor->runAction(
		Sequence::create(ScaleTo::create(0.05,0.2),
								ScaleTo::create(0.05,0.4),
								ScaleTo::create(0.05,0.6),
								ScaleTo::create(0.05,0.8),
								ScaleTo::create(0.05,1),NULL)
	);
}
bool MovableTile::init(){
	if (!Node::init()){
		return false;
	}
	//设置hasMerged属性的默认值
	this->hasMerged=false;
	//获取随机值2或4
	srand((unsigned int)time(0));
	int n=rand()%10;
	this->m_number=n>1?2:4;
	//背景层
	auto bgColor=LayerColor::create(Color4B(230,220,210,255),GAME_TILE_WIDTH,GAME_TILE_HEIGHT);
	if(this->m_number==4)
		bgColor->setColor(Color3B(230,220,190));
	bgColor->setTag(101);
	this->addChild(bgColor);
	//数字层
	Label* m_number=Label::createWithTTF(StringUtils::format("%d",this->m_number), "fonts/jokerman.ttf", FONT_MIDDLE);
	m_number->setPosition(Point(GAME_TILE_WIDTH/2,GAME_TILE_HEIGHT/2));
	m_number->setColor(Color3B(0,0,0));
	m_number->setTag(102);
	bgColor->addChild(m_number);
	return true;
}
void MovableTile::doubleValue(){
	this->m_number=this->m_number*2;
	auto bgColor=this->getChildByTag(101);
	Label* m_number=(Label*)bgColor->getChildByTag(102);
	m_number->setString(StringUtils::format("%d",this->m_number));
	this->hasMerged=true;

	//动画效果
	bgColor->runAction(
		Sequence::create(ScaleTo::create(0.05,1.06),
		ScaleTo::create(0.05,1.12),
		ScaleTo::create(0.05,1.2),
		ScaleTo::create(0.05,1.12),
		ScaleTo::create(0.05,1.06),
		ScaleTo::create(0.05,1),NULL)
		);
	switch (this->m_number)
	{
		case 2:
			bgColor->setColor(Color3B(230,220,210));break;
		case 4:
			bgColor->setColor(Color3B(230,220,190));break;
		case 8:
			bgColor->setColor(Color3B(230,150,100));
			m_number->setColor(Color3B(255,255,255));break;
		case 16:
			bgColor->setColor(Color3B(230,120,80));
			m_number->setColor(Color3B(255,255,255));break;;
		case 32:
			bgColor->setColor(Color3B(230,100,90));
			m_number->setColor(Color3B(255,255,255));break;;
		case 64:
			bgColor->setColor(Color3B(230,70,60));
			m_number->setColor(Color3B(255,255,255));break;;
		case 128:
			bgColor->setColor(Color3B(230,190,60));
			m_number->setColor(Color3B(255,255,255));break;;
		case 256:
			bgColor->setColor(Color3B(230,190,60));
			m_number->setColor(Color3B(255,255,255));break;;
		case 512:
			bgColor->setColor(Color3B(230,190,60));
			m_number->setColor(Color3B(255,255,255));break;;
		case 1024:
			bgColor->setColor(Color3B(210,100,30));
			m_number->setColor(Color3B(255,255,255));break;;
		case 2048:
			bgColor->setColor(Color3B(210,100,30));
			m_number->setColor(Color3B(255,255,255));break;;
	}
}
void MovableTile::setNumber(int n){
	auto bgColor=this->getChildByTag(101);
	Label* m_number=(Label*)bgColor->getChildByTag(102);
	m_number->setString(StringUtils::format("%d",n));
	this->m_number=n;
}