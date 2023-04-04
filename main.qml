import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    width: 1000
    height: 680
    visible: true
    title: qsTr("Hello World")
    property int xpos : 170;
    property int ypos : 200;
//    property int x : 0;
//    property int y : 0;
    property int xchange : 0;
    property int ychange : 0;
    property string pic1: "file:///E:/radioicon/background.jpg";
    property string heli: "file:///E:/radioicon/heli2.png";
    Image {
            width: 840
            height: 680
            fillMode: Image.PreserveAspectCrop
            anchors.fill: parent
            source: "file:///E:/radioicon/background.jpg"
        }

        Image {
            id: item1
            width: 200
            height: 100
            x: xpos
            y: xpos
            anchors.centerIn: parent;
            source: "file:///E:/radioicon/heli2.png"
            }


    Rectangle{ //circle
        x: 790
        y: 400
        width: 200
        height: width
        radius: width/2;
        color: "white"
        border.color: "#00008b"
        border.width: 3
        Text{
            text: "o"
            id: center
            anchors.centerIn: parent;

        }

        MouseArea {
            anchors.fill: parent
            onPositionChanged:
                       {
                           console.log("x: " + mouse.x + " y: " + mouse.y)
                           myapp.sendMouseInput(mouse.x, mouse.y)

                       }
                       onReleased: {
                           myapp.sendMouseInput(100, 100)
                       }

        }
    }
    Button{
        id: btn1
        text: qsTr("<<<")
        x: 500
        y: 500
        width: 80
        height: 30
//        onClicked: {
//            xpos = xpos - 5;
//            console.log("Hello")
//        }
        onClicked:
               {
                   myapp.button_left()
               }
    }
    Button{
        id: btn2
        text: qsTr(">>>")
        x: 700
        y: 500
        width: 80
        height: 30
        onClicked:
              {
                  myapp.button_right()
              }
    }
    Button{
        id: btn3
        text: qsTr(">>>")
        x: 600
        y: 600
        width: 80
        height: 30
        rotation: 90
        onClicked:
               {
                   myapp.button_down()
               }
    }
    Button{
        id: btn4
        text: qsTr("<<<")
        x: 600
        y: 400
        width: 80
        height: 30
        rotation: 90
        onClicked:
              {
                  myapp.button_up()
              }
    }
    Connections
      {
          target:myapp
          ignoreUnknownSignals: true

          function onSendMouse(xmousevalue, ymousevalue)
          {
              item1.anchors.verticalCenterOffset = ymousevalue
              item1.anchors.horizontalCenterOffset = xmousevalue
//              center.anchors.verticalCenterOffset = ymousevalue
//              center.anchors.horizontalCenterOffset = xmousevalue
          }

          function onSendCenter(xcentervalue, ycentervalue)
          {
              center.anchors.verticalCenterOffset = ycentervalue
              center.anchors.horizontalCenterOffset = xcentervalue
          }
          function onSendVer(vervalue)
          {
              item1.anchors.verticalCenterOffset = vervalue

          }
          function onSendHor(horvalue)
          {
              item1.anchors.horizontalCenterOffset = horvalue

          }
      }

}
