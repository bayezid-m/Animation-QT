#include "myapp.h"
#include <QTimer>
#include <QDebug>

int xpos = 0;
int ypos = 0;

int xchange=0;
int ychange=0;
int xcenter = 0;
int ycenter = 0;
myapp::myapp(QObject *parent):
    QObject(parent)

{
    timer = new QTimer(this);
    connect(timer, &QTimer::timeout, this, &myapp::updatejoystick);
    timer->start(100);
}




/*
void myapp::func_btn_pls()
{
    val++;
    emit sendMess2(QString::number(val));
    qDebug() << "Increment";
}
*/
void myapp::button_up()
{
    ypos-=10;
    emit sendVer(QString::number(ypos));
    qDebug() << ypos << " y";
}
void myapp::button_down()
{
    ypos+=10;
    emit sendVer(QString::number(ypos));
    qDebug() << ypos << " y";
}
void myapp::button_left()
{
    xpos-=10;
    emit sendHor(QString::number(xpos));
    qDebug() << xpos << " x";
}
void myapp::button_right()
{
    xpos+=10;
    emit sendHor(QString::number(xpos));
    qDebug() << xpos << " x";
}

int myapp::sendMouseInput(int x, int y)
{


    xchange= ((x-100)/10);
    ychange= ((y-100)/10);

    xcenter= ((x-50)/5);
    ycenter= ((y-50)/5);
}

void myapp::updatejoystick()
{
    xpos=xchange+xpos;
    ypos=ychange+ypos;
    emit sendMouse(QString::number(xpos), QString::number(ypos));
    emit sendCenter(QString::number(xcenter), QString::number(ycenter));
}



