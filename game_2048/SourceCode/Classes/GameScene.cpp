#include <iostream>
#include "GameScene.h"
#include "GameOverScene.h"
#include "GameWinScene.h"
#include "tinyxml2/tinyxml2.h"
USING_NS_CC;
bool Game::init(){
	win=false;//初始化win
	backCount=0;//初始化backCount
	this->haveMoved=true;//初始化haveMoved
	if(!Layer::init())
		return false;
	//显示标题
	auto labelTitle=Label::createWithTTF("2048", "fonts/Abduction.ttf", FONT_SMALL);
	labelTitle->setPosition(Point(labelTitle->getContentSize().width/2+FONT_SMALL/3,GAME_SCREEN_HEIGHT-labelTitle->getContentSize().height/2-FONT_SMALL/3));
	labelTitle->setColor(Color3B(238,149,114));
	this->addChild(labelTitle);
	//显示分数
	auto labelScore=Label::createWithTTF("SCORE: 0", "fonts/bauhs93.ttf", FONT_LARGE);
	labelScore->setPosition(Point(GAME_SCREEN_WIDTH/2,GAME_SCREEN_HEIGHT-labelScore->getContentSize().height*1.7));
	labelScore->setColor(Color3B(238,149,114));
	labelScore->setTag(103);
	this->addChild(labelScore);
	//显示中心游戏区域
	gameArea=LayerColor::create(Color4B(245,245,245,255),GAME_TILE_WIDTH*4+GAME_TILE_BORDER*5,GAME_TILE_HEIGHT*4+GAME_TILE_BORDER*5);
	gameArea->setPosition(Point((GAME_SCREEN_WIDTH-GAME_TILE_WIDTH*4-GAME_TILE_BORDER*5)/2,(GAME_SCREEN_HEIGHT-GAME_TILE_HEIGHT*4-GAME_TILE_BORDER*5)/2));
	this->addChild(gameArea);
	//显示16个色块的底色
	for(int i=0;i<GAME_ROWS;i++){
		for(int j=0;j<GAME_COLS;j++){
			auto tile=LayerColor::create(Color4B(100,100,100,255),GAME_TILE_WIDTH,GAME_TILE_HEIGHT);
			tile->setPosition(Point(GAME_TILE_WIDTH*i+GAME_TILE_BORDER*(i+1),GAME_TILE_HEIGHT*j+GAME_TILE_BORDER*(j+1)));
			gameArea->addChild(tile);
		}
	}
	//初始化分数
	this->score=0;
	//初始化网格数组
	for(int i=0;i<GAME_ROWS;i++){
		for(int j=0;j<GAME_COLS;j++){
			map[i][j]=-1;
		}
	}
	//初始化一个可移动方块
	createNewTile();
	//初始化是否播放merge.wav音效的属性
	this->m_play_sound_merge=false;
	//定义back
	auto menu=Menu::create();
	menu->setTag(104);
	menu->setPosition(Point::ZERO);
	auto labelBack=Label::createWithTTF("Back(0)", "fonts/arial.ttf", FONT_SMALL);
	labelBack->setTag(106);
	labelBack->setColor(Color3B(238,149,114));
	auto menuItemLabel_back=MenuItemLabel::create(labelBack,CC_CALLBACK_1(Game::back,this));
	menuItemLabel_back->setTag(105);
	menuItemLabel_back->setPosition(Point(labelBack->getContentSize().width,GAME_SCREEN_HEIGHT/2-gameArea->getContentSize().height/2-labelBack->getContentSize().height*2));	
	menu->addChild(menuItemLabel_back);
	//定义restart
	auto labelRestart=Label::createWithTTF("Restart", "fonts/arial.ttf", FONT_SMALL);
	labelRestart->setColor(Color3B(238,149,114));
	auto menuItemLabel_restart=MenuItemLabel::create(labelRestart,CC_CALLBACK_1(Game::restart,this));
	menuItemLabel_restart->setPosition(Point(GAME_SCREEN_WIDTH-labelRestart->getContentSize().width,GAME_SCREEN_HEIGHT/2-gameArea->getContentSize().height/2-labelRestart->getContentSize().height*2));
	menu->addChild(menuItemLabel_restart);
	this->addChild(menu);
	//触摸事件
	auto event=EventListenerTouchOneByOne::create();
	event->onTouchBegan=[&](Touch* t,Event* e){
		from_x=t->getLocation().x;
		from_y=t->getLocation().y;
		m_startMove=true;
		return true;
	};
	event->onTouchMoved=[&](Touch* t,Event* e){
		to_x=t->getLocation().x;
		to_y=t->getLocation().y;
		if(m_startMove && (abs(from_x-to_x)>20 || abs(from_y-to_y)>20)){
			if(abs(from_x-to_x)>abs(from_y-to_y)){
				if(from_x>to_x)
					m_dir=E_MOVE_DIR::LEFT;
				else
					m_dir=E_MOVE_DIR::RIGHT;
			}else{
				if(from_y>to_y)
					m_dir=E_MOVE_DIR::DOWN;
				else
					m_dir=E_MOVE_DIR::UP;
			}
			m_startMove=false;
			moveAll(m_dir);
		}
	};

	Director::getInstance()->getEventDispatcher()->addEventListenerWithSceneGraphPriority(event,this);
	return true;
}
Scene* Game::createScene(){
	auto scene=Scene::create();
	auto layer=Game::create();
	scene->addChild(layer);
	return scene;
}
void Game::moveAll(E_MOVE_DIR dir){
	bool isDead=true;
	//死亡判定
	if(tiles.size()>=GAME_COLS*GAME_ROWS){
		for(int i=0;i<GAME_COLS;i++){
			for(int j=0;j<GAME_ROWS;j++){
				//上
				if(j+1 < GAME_ROWS){
					if(tiles.at(map[i][j])->m_number==tiles.at(map[i][j+1])->m_number){
						isDead=false;
						break;
					}
				}
				//下
				if(j-1 >= 0){
					if(tiles.at(map[i][j])->m_number==tiles.at(map[i][j-1])->m_number){
						isDead=false;
						break;
					}
				}
				//左
				if(i-1 >= 0){
					if(tiles.at(map[i][j])->m_number==tiles.at(map[i-1][j])->m_number){
						isDead=false;
						break;
					}
				}
				//右
				if(i+1 < GAME_COLS){
					if(tiles.at(map[i][j])->m_number==tiles.at(map[i+1][j])->m_number){
						isDead=false;
						break;
					}
				}
			}
			if(!isDead)
				break;
		}
		if(isDead){
			auto scene=GameOver::createScene();
			Director::getInstance()->replaceScene(TransitionFlipAngular::create(0.5,scene));
		}
	}

	//存值,为点击back提供数据
	if(this->haveMoved){
		std::vector<int> temp;
		for(int i=0;i<GAME_COLS;i++){
			for(int j=0;j<GAME_ROWS;j++){
				if(map[j][i] == -1)
					temp.push_back(0);
				else
					temp.push_back(tiles.at(map[j][i])->m_number);
			}
		}
		history.push_back(temp);
		if(history.size()>GAME_BACK_LIMIT)
			history.erase(history.begin());
	}
	//移动方块
	this->haveMoved=false;
	switch (dir)
	{
	case E_MOVE_DIR::LEFT:
		moveLeft();
		if(this->haveMoved){
			createNewTile();
			if(backCount<GAME_BACK_LIMIT){
				backCount++;
				Menu* menu=(Menu*)this->getChildByTag(104);
				MenuItemLabel* menuItemLabel=(MenuItemLabel*)menu->getChildByTag(105);
				Label* labelBack=(Label*)menuItemLabel->getChildByTag(106);
				labelBack->setString(StringUtils::format("Back(%d)",backCount));
			}
		}
		break;
	case E_MOVE_DIR::RIGHT:
		moveRight();
		if(this->haveMoved){
			createNewTile();
			if(backCount<GAME_BACK_LIMIT){
				backCount++;
				Menu* menu=(Menu*)this->getChildByTag(104);
				MenuItemLabel* menuItemLabel=(MenuItemLabel*)menu->getChildByTag(105);
				Label* labelBack=(Label*)menuItemLabel->getChildByTag(106);
				labelBack->setString(StringUtils::format("Back(%d)",backCount));
			}
		}
		break;
	case E_MOVE_DIR::UP:
		moveUp();
		if(this->haveMoved){
			createNewTile();
			if(backCount<GAME_BACK_LIMIT){
				backCount++;
				Menu* menu=(Menu*)this->getChildByTag(104);
				MenuItemLabel* menuItemLabel=(MenuItemLabel*)menu->getChildByTag(105);
				Label* labelBack=(Label*)menuItemLabel->getChildByTag(106);
				labelBack->setString(StringUtils::format("Back(%d)",backCount));
			}
		}
		break;
	case E_MOVE_DIR::DOWN:
		moveDown();
		if(this->haveMoved){
			createNewTile();
			if(backCount<GAME_BACK_LIMIT){
				backCount++;
				Menu* menu=(Menu*)this->getChildByTag(104);
				MenuItemLabel* menuItemLabel=(MenuItemLabel*)menu->getChildByTag(105);
				Label* labelBack=(Label*)menuItemLabel->getChildByTag(106);
				labelBack->setString(StringUtils::format("Back(%d)",backCount));
			}
		}
		break;
	}
	//播放声音
	if(this->m_play_sound_merge){
		CocosDenshion::SimpleAudioEngine::getInstance()->playEffect("merge.wav");
		this->m_play_sound_merge=false;
	}
	else if(haveMoved)
		CocosDenshion::SimpleAudioEngine::getInstance()->playEffect("move.wav");
	else
		CocosDenshion::SimpleAudioEngine::getInstance()->playEffect("fail.wav");
	//更新分数
	Label* labelScore=(Label*)this->getChildByTag(103);
	labelScore->setString(StringUtils::format("SCORE: %d",this->score));
	//如果达到2048
	if(win){
		auto scene=GameWin::createScene();
		Director::getInstance()->replaceScene(TransitionShrinkGrow::create(0.5,scene));
	}
}
void Game::moveLeft(){
	bool shouldEnd=false;
	for(int i=1;i<GAME_COLS;i++){
		for(int j=0;j<GAME_ROWS;j++){
			shouldEnd=false;
			for(int k=0;k<i&&!shouldEnd;k++){ 
				if(map[i-k][j]>-1 && map[i-k-1][j]==-1){ //移动
					map[i-k-1][j]=map[i-k][j];
					map[i-k][j]=-1;
					tiles.at(map[i-k-1][j])->moveTo(i-k-1,j);
					this->haveMoved=true;
				}else if(map[i-k][j]>-1 && map[i-k-1][j]>-1){ //合并
					//判断是否可消除
					if(tiles.at(map[i-k][j])->m_number == tiles.at(map[i-k-1][j])->m_number){ //如果数字一致
						if(!tiles.at(map[i-k][j])->hasMerged && !tiles.at(map[i-k-1][j])->hasMerged){ //如果两个方块都没有合并过
							tiles.at(map[i-k][j])->removeFromParent();//删除块的显示
							int index=map[i-k][j];
							tiles.erase(map[i-k][j]); //清除Vector中值
							for(int x=0;x<GAME_ROWS;x++){
								for(int y=0;y<GAME_COLS;y++){
									if(map[x][y] > index)
										map[x][y]--;  //重新设置Vector中各项的index值
								}
							}
							map[i-k][j]=-1;    //map数组内值设为-1
							tiles.at(map[i-k-1][j])->doubleValue();
							this->score=this->score+tiles.at(map[i-k-1][j])->m_number;  //计算分数
							if(tiles.at(map[i-k-1][j])->m_number==2048)
								win=true;
							this->haveMoved=true;
							this->m_play_sound_merge=true;
						}
					}
					shouldEnd=true;//如果数字不一致，或者两个方块有一个曾合并过，则直接将shouldEnd设置为true,退出参数k的循环
				}
			}
		}
	}
	//将hasMerged全部重置为false
	for(int t=0;t<tiles.size();t++)
		tiles.at(t)->hasMerged=false;
}
void Game::moveRight(){
	bool shouldEnd=false;
	for(int i=GAME_COLS-2;i>-1;i--){
		for(int j=0;j<GAME_ROWS;j++){
			shouldEnd=false;
			for(int k=0;k<GAME_COLS-1-i && !shouldEnd;k++){
				if(map[i+k][j]>-1 && map[i+k+1][j]==-1){ //移动
					map[i+k+1][j]=map[i+k][j];
					map[i+k][j]=-1;
					tiles.at(map[i+k+1][j])->moveTo(i+k+1,j);
					this->haveMoved=true;
				}else if(map[i+k][j]>-1 && map[i+k+1][j]>-1){ //合并
					//判断是否可消除
					if(tiles.at(map[i+k][j])->m_number == tiles.at(map[i+k+1][j])->m_number){//如果数字一致
						if(!tiles.at(map[i+k][j])->hasMerged && !tiles.at(map[i+k+1][j])->hasMerged){ //如果两个方块都没有合并过
							tiles.at(map[i+k][j])->removeFromParent();//删除块的显示
							int index=map[i+k][j];
							tiles.erase(map[i+k][j]); //清除Vector中值
							for(int x=0;x<GAME_ROWS;x++){
								for(int y=0;y<GAME_COLS;y++){
									if(map[x][y] > index)
										map[x][y]--;  //重新设置Vector中各项的index值
								}
							}
							map[i+k][j]=-1;    //map数组内值设为-1
							tiles.at(map[i+k+1][j])->doubleValue();
							this->score+=tiles.at(map[i+k+1][j])->m_number;  //计算分数
							if(tiles.at(map[i+k+1][j])->m_number==2048)
								win=true;
							this->haveMoved=true;
							this->m_play_sound_merge=true;
						}
					}
					shouldEnd=true;//如果数字不一致，或者两个方块有一个曾合并过，则直接将shouldEnd设置为true,退出参数k的循环
				}
			}
		}
	}
	//将hasMerged全部重置为false
	for(int t=0;t<tiles.size();t++)
		tiles.at(t)->hasMerged=false;
}
void Game::moveUp(){
	bool shouldEnd=false;
	for(int j=GAME_ROWS-2;j>-1;j--){
		for(int i=0;i<GAME_COLS;i++){
			shouldEnd=false;
			for(int k=0;k<GAME_ROWS-1-j && !shouldEnd;k++){
				if(map[i][j+k]>-1 && map[i][j+k+1]==-1){ //移动
					map[i][j+k+1]=map[i][j+k];
					map[i][j+k]=-1;
					tiles.at(map[i][j+k+1])->moveTo(i,j+k+1);
					this->haveMoved=true;
				}else if(map[i][j+k]>-1 && map[i][j+k+1]>-1){ //合并
					//判断是否可消除
					if(tiles.at(map[i][j+k])->m_number == tiles.at(map[i][j+k+1])->m_number){//如果数字一致
						if(!tiles.at(map[i][j+k])->hasMerged && !tiles.at(map[i][j+k+1])->hasMerged){ //如果两个方块都没有合并过
							tiles.at(map[i][j+k])->removeFromParent();//删除块的显示
							int index=map[i][j+k];
							tiles.erase(map[i][j+k]); //清除Vector中值
							for(int x=0;x<GAME_ROWS;x++){
								for(int y=0;y<GAME_COLS;y++){
									if(map[x][y] > index)
										map[x][y]--;  //重新设置Vector中各项的index值
								}
							}
							map[i][j+k]=-1;    //map数组内值设为-1
							tiles.at(map[i][j+k+1])->doubleValue();
							this->score+=tiles.at(map[i][j+k+1])->m_number;  //计算分数
							if(tiles.at(map[i][j+k+1])->m_number==2048)
								win=true;
							this->haveMoved=true;
							this->m_play_sound_merge=true;
						}
					}
					shouldEnd=true;//如果数字不一致，或者两个方块有一个曾合并过，则直接将shouldEnd设置为true,退出参数k的循环
				}
			}
		}
	}
	//将hasMerged全部重置为false
	for(int t=0;t<tiles.size();t++)
		tiles.at(t)->hasMerged=false;
}
void Game::moveDown(){
	bool shouldEnd=false;
	for(int j=1;j<GAME_ROWS;j++){
		for(int i=0;i<GAME_COLS;i++){
			shouldEnd=false;
			for(int k=0;k<j && !shouldEnd;k++){
				if(map[i][j-k]>-1 && map[i][j-k-1]==-1){ //移动
					map[i][j-k-1]=map[i][j-k];
					map[i][j-k]=-1;
					tiles.at(map[i][j-k-1])->moveTo(i,j-k-1);
					this->haveMoved=true;
				}else if(map[i][j-k]>-1 && map[i][j-k-1]>-1){ //合并
					//判断是否可消除
					if(tiles.at(map[i][j-k])->m_number == tiles.at(map[i][j-k-1])->m_number){//如果数字一致
						if(!tiles.at(map[i][j-k])->hasMerged && !tiles.at(map[i][j-k-1])->hasMerged){ //如果两个方块都没有合并过
							tiles.at(map[i][j-k])->removeFromParent();//删除块的显示
							int index=map[i][j-k];
							tiles.erase(map[i][j-k]); //清除Vector中值
							for(int x=0;x<GAME_ROWS;x++){
								for(int y=0;y<GAME_COLS;y++){
									if(map[x][y] > index)
										map[x][y]--;  //重新设置Vector中各项的index值
								}
							}
							map[i][j-k]=-1;    //map数组内值设为-1
							tiles.at(map[i][j-k-1])->doubleValue();
							this->score+=tiles.at(map[i][j-k-1])->m_number;  //计算分数
							if(tiles.at(map[i][j-k-1])->m_number==2048)
								win=true;
							this->haveMoved=true;
							this->m_play_sound_merge=true;
						}
					}
					shouldEnd=true;//如果数字不一致，或者两个方块有一个曾合并过，则直接将shouldEnd设置为true,退出参数k的循环
				}
			}
		}
	}
	//将hasMerged全部重置为false
	for(int t=0;t<tiles.size();t++)
		tiles.at(t)->hasMerged=false;
}
void Game::createNewTile(){
	auto tile=MovableTile::create();
	srand((unsigned int)time(0));
	int randNumber=rand()%(GAME_ROWS*GAME_COLS-tiles.size());
	int i,j;
	bool isFound=false;
	for(i=0;i<GAME_ROWS;i++){
		for(j=0;j<GAME_COLS;j++){
			if(map[i][j]==-1)
				randNumber--;
			if(randNumber<0){
				isFound=true;
				break;
			}
		}
		if(isFound)
			break;
	}
	tile->createNewTile(i,j);
	tiles.pushBack(tile);
	map[i][j]=tiles.getIndex(tile);
	gameArea->addChild(tile);
}
void Game::restart(Ref* object){
	auto scene=Game::createScene();
	Director::getInstance()->replaceScene(scene);
}
void Game::back(Ref* object){
	if(backCount==0)
		return;
	backCount--;
	Menu* menu=(Menu*)this->getChildByTag(104);
	MenuItemLabel* menuItemLabel=(MenuItemLabel*)menu->getChildByTag(105);
	Label* labelBack=(Label*)menuItemLabel->getChildByTag(106);
	labelBack->setString(StringUtils::format("Back(%d)",backCount));
	//清除现有数据
	for(int i=0;i<GAME_COLS;i++){
		for(int j=0;j<GAME_ROWS;j++){
			if(map[i][j]>-1)
				tiles.at(map[i][j])->removeFromParent();//去掉所有显示的方块
			map[i][j]=-1;//map中所有值重置为-1
		}
	}
	tiles.clear();//清空tiles
	//恢复历史数据
	int temp=0;
	for(int i=0;i<GAME_COLS*GAME_ROWS;i++){
		if(history.at(history.size()-1).at(i)!=0){
			MovableTile* tile=MovableTile::create();
			tile->hasMerged=false;
			tile->setNumber(history.at(history.size()-1).at(i)/2);
			tile->moveTo(i%GAME_COLS,i/GAME_COLS);
			tile->doubleValue();
			gameArea->addChild(tile);

			tiles.pushBack(tile);
			map[i%GAME_COLS][i/GAME_COLS]=temp;
			temp++;
		}	
	}
	history.pop_back();
}