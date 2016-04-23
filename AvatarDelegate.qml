import QtQuick 2.0
import QtGraphicalEffects 1.0
Rectangle {
    property bool transparent: true
    property bool highlighted: false
    property string name:"invalid";
    property bool interactive: false
    property alias main_avatar_source:main_avatar.source
    property alias mini_avatar_friends_enabled: mini_avatar_friends.checked
    property alias mini_avatar_livre_enabled: mini_avatar_livre.checked
    property alias mini_avatar_sport_enabled: mini_avatar_sport.checked
    property alias mini_avatar_telephone_enabled: mini_avatar_telephone.checked

    border.color: "black"
    border.width: highlighted ? 5 : 0
    width: 100
    height: width* main_avatar.implicitHeight/main_avatar.implicitWidth
    Image {
        id: main_avatar
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        anchors.margins: 5
    }
        Row{
            width: parent.width
            height: 0.20*parent.width
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
        Image{
            id:mini_avatar_friends
            visible: !transparent && (interactive || (!interactive && checked))
            fillMode: Image.PreserveAspectFit
            width: parent.width*0.25
            height: parent.height
//            anchors.left: parent.left
//            anchors.bottom: parent.bottom
            source:"qrc:/avatars/avatar_imgs/Secondary/friends.png"
            property bool  checked: false
            Rectangle{
                anchors.fill: parent
                color: parent.checked ?  "transparent":"#99000000"
            }
            MouseArea{
                enabled: interactive
                anchors.fill: parent
                onClicked: {
                    parent.checked= !(parent.checked)
                }
            }
        }
        Image{
            id:mini_avatar_livre
            visible: !transparent && (interactive || (!interactive && checked))
            fillMode: Image.PreserveAspectFit
            width: parent.width*0.25
            height:  parent.height
//            anchors.left: mini_avatar_friends.right
//            anchors.bottom: parent.bottom
            source: "qrc:/avatars/avatar_imgs/Secondary/livre.png"
            property bool  checked: false
            Rectangle{
                anchors.fill: parent
                color: parent.checked ?  "transparent":"#99000000"
            }
            MouseArea{
                enabled: interactive
                anchors.fill: parent
                onClicked: {
                    parent.checked= !(parent.checked)
                }
            }
        }
        Image{
            id:mini_avatar_sport
            visible: !transparent && (interactive || (!interactive && checked))
            fillMode: Image.PreserveAspectFit
            width: parent.width*0.25
            height:  parent.height
//            anchors.left: mini_avatar_livre.right
//            anchors.bottom: parent.bottom
            source:"qrc:/avatars/avatar_imgs/Secondary/sport.png"
            property bool  checked: false
            Rectangle{
                anchors.fill: parent
                color: parent.checked ?  "transparent":"#99000000"
            }
            MouseArea{
                enabled: interactive
                anchors.fill: parent
                onClicked: {
                    parent.checked= !(parent.checked)
                }
            }
        }
        Image{
            id:mini_avatar_telephone
            visible: !transparent && (interactive || (!interactive && checked))
            fillMode: Image.PreserveAspectFit
            width: parent.width*0.25
            height:  parent.height
//            anchors.left: mini_avatar_sport.right
//            anchors.bottom: parent.bottom
            source:"qrc:/avatars/avatar_imgs/Secondary/telephone.png"
            property bool checked: false
            Rectangle{
                anchors.fill: parent
                color: parent.checked ?  "transparent":"#99000000"
            }
            MouseArea{
                enabled: interactive
                anchors.fill: parent
                onClicked: {
                    parent.checked= !(parent.checked)
                }
            }
        }
        }
        Loader{
            anchors.fill: parent
            active:transparent
            sourceComponent: Colorize {
                anchors.fill: parent
                source: main_avatar
                hue: 0.0
                saturation: 0.0
                lightness: 0.0
            }
        }



}
