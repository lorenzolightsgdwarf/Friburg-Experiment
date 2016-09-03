import QtQuick 2.0
import QtGraphicalEffects 1.0
Rectangle {
    property bool transparent: true
    property bool highlighted: false
    property bool isPlaceHolder:false
    //only when not inteactive
    property bool selectingAvatar:false
    property string name:"invalid";
    property bool interactive: false
    property alias main_avatar_source:main_avatar.source
    property alias mini_avatar_friends_enabled: mini_avatar_friends.checked
    property alias mini_avatar_livre_enabled: mini_avatar_livre.checked
    property alias mini_avatar_sport_enabled: mini_avatar_sport.checked
    property alias mini_avatar_telephone_enabled: mini_avatar_telephone.checked
    color: if(isPlaceHolder) return "transparent"
            else if(selectingAvatar) return  "#68efad"
            else return  "white"
    border.color: isPlaceHolder ? "transparent" : "black"
    border.width: highlighted ? 5 : 0
    width: 100
    height: width* main_avatar.implicitHeight/main_avatar.implicitWidth

    Image {
        visible: !isPlaceHolder
        id: main_avatar
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        anchors.margins: 5
    }
    Text{
        visible: selectingAvatar && !isPlaceHolder
        id:choosing_text
        width: parent.width
        text: "…choisit son avatar"
        verticalAlignment:Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        font.family: "Helvetica"
        font.pointSize: 10
        fontSizeMode: Text.Fit;
        minimumPointSize: 8;
        anchors.bottom: avatar_row.top
        anchors.bottomMargin: 2
        style: Text.Outline;
        styleColor: "transparent"
        SequentialAnimation{
            running: selectingAvatar
            loops: Animation.Infinite
            ColorAnimation {
                target: choosing_text
                property: "styleColor"
                from: "transparent"
                to: "red"
                duration: 2000
            }
            ColorAnimation {
                target: choosing_text
                property: "styleColor"
                from: "red"
                to: "transparent"
                duration: 2000
            }
        }
    }
    Row{
        id:avatar_row
        visible: !interactive && !isPlaceHolder
        opacity: !interactive ? 1 : 1-like_text.opacity
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
    Rectangle{
        id:like_text
        visible: interactive && !isPlaceHolder
        width: 2*parent.width/3
        height: 0.20*parent.width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 5
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
        }
        Behavior on opacity{
            NumberAnimation{
                duration: 500
            }

        }
        Text{
            text:"J'aime"
            verticalAlignment:Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            font.family: "Helvetica"
            font.pointSize: 15
            fontSizeMode: Text.Fit;
            minimumPointSize: 8;
            anchors.fill: parent
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    like_text.visible=false;
                    avatar_row.visible=true;
                    like_text.opacity=0;
                }
            }
        }
    }
    Loader{
        anchors.fill: parent
        active:transparent && !isPlaceHolder
        sourceComponent: Colorize {
            anchors.fill: parent
            source: main_avatar
            hue: 0.0
            saturation: 0.0
            lightness: 0.0
        }
    }




}
