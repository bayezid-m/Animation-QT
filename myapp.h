
#define MYAPP_H
#include <QtCore>
#include <QDebug>
#include <QTimer>


class myapp : public QObject
{
    Q_OBJECT

public:
    QTimer* timer;
    explicit myapp(QObject * parent = 0);


signals:
    void sendVer(const QString &vervalue);
    void sendHor(const QString &horvalue);
    void sendMouse(const QString &xmousevalue, const QString &ymousevalue);
    void sendCenter(const QString &xcentervalue, const QString &ycentervalue);
public slots:
    void button_up();
    void button_left();
    void button_right();
    void button_down();
    int sendMouseInput(int xmousevalue, int ymousevalue);

    void updatejoystick();

};

