#include<iostream>
#include "cocos2d.h"
#include "gamedefine.h"
USING_NS_CC;
class MovableTile:public Node{
	bool init();
public:
	int m_row;
	int m_col;
	int m_number;
	bool hasMerged;
	void moveTo(int r,int c);
	void createNewTile(int r,int c);
	void doubleValue();
	void setNumber(int n);
	CREATE_FUNC(MovableTile);
};