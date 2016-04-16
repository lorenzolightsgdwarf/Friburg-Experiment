import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Rectangle {
    id:splash_screen

    anchors.fill: parent
    color:"#e3f2fd"

    Rectangle{
        id:welcome
        color:"#2196f3"
        width: 2/3*parent.width
        height: parent.height-20
        anchors.centerIn: parent
        anchors.margins: 10
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
        }
        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top
            anchors.margins: 10
            color:"#2962ff"
            width:  2/3*parent.width
            height: Math.min(16/9*width,parent.height-20)
            Text {
                anchors.centerIn: parent
                text: "WelCome\n Click to Start"
                color:"white"
                font.family: "Helvetica"
                font.pointSize: 24
                antialiasing: true
            }
            MouseArea{
                enabled: !settings.visible
                anchors.fill: parent
                onClicked: {
                    if(window.condition==0)
                        logger.write_read_instruction("Avatar_Online_Disabled")
                    else if(window.condition==1)
                        logger.write_read_instruction("Avatar_Online_Enabled_Faces")
                    else if(window.condition==2)
                        logger.write_read_instruction("Avatar_Online_Enabled_Neutral")
                    welcome.visible=false;
                    instruction.visible=true}
            }
            Rectangle{
                color:"#00e676"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: 10
                width:  75
                height:width
                radius: width/2
                Image {
                    source:"qrc:/settings.png"
                    anchors.fill: parent
                }
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                }
                MouseArea{
                    anchors.fill: parent;
                    onPressed: parent.layer.enabled=false
                    onReleased: parent.layer.enabled=true
                    onClicked: settings.visible=true
                }
            }
        }
    }
    Rectangle{
        id:instruction
        visible: false
        color:"#2962ff"
        width: 2/3*parent.width
        height: parent.height-20
        anchors.centerIn: parent
        anchors.margins: 10
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
        }
        ColumnLayout{
            id:instruction_zone
            spacing: 10
            anchors.fill: parent
            anchors.margins: 20
            Text{
                id:title
                text:"<b><center>Consignes</center></b><br><ul><li>Réalise les 4 exercices proposés, dans l’ordre qui te convient. Les exercices sont de difficulté variable (de <i>très facile</i> à <i>très difficile</i>)</li>
<br><li>Choisis un avatar dans la galerie de portraits qui t’est proposée. Tu es libre de faire ceci quand tu veux.</li>
<br><li>Lorsque tu auras terminé les exercices et choisi ton avatar, clique sur le bouton <i>Déconnexion</i>.</li></ul>"
                color: "white"
                wrapMode: Text.WordWrap
                font.family: "Helvetica"
                font.pointSize: 24
                Layout.alignment: Qt.AlignHCenter
                antialiasing: true
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            Item{
                Layout.preferredHeight: 150
                Layout.fillWidth: true
                Rectangle{
                    anchors.centerIn:  parent
                    anchors.margins: 10
                    width: 100
                    color:"#00e676"
                    height: width
                    radius: width/2
                    layer.enabled: true
                    layer.effect: DropShadow {
                        transparentBorder: true
                    }
                    Image {
                        source: "qrc:/Button-Next.png"
                        anchors.fill: parent
                    }
                    MouseArea{
                        anchors.fill: parent;
                        onPressed: parent.layer.enabled=false
                        onReleased: parent.layer.enabled=true
                        onClicked: {
                            logger.write_start_experiment()
                            window.page=1
                        }
                    }
                }
            }
        }
    }



    Rectangle{
        id:settings
        color: "#EE000000"
        anchors.fill: parent
        visible: false
        Rectangle{
            color:"#1565c0"
            anchors.centerIn: parent
            height: 2/3*parent.height
            width: 3/4*height

            Column{
                anchors.margins: 20
                anchors.centerIn: parent
                spacing: 20
                TextField{
                    anchors.margins: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    id:pin
                    placeholderText: "Insert Pin"
                }
                ExclusiveGroup { id: conditionGroup }
                RadioButton {
                    text: "Disable Avatar"
                    checked: true
                    onCheckedChanged: if(checked) window.condition=0
                    enabled: pin.text=="0101"
                    exclusiveGroup: conditionGroup
                }
                RadioButton {
                    text: "Show Avatar with Faces"
                    onCheckedChanged: if(checked) window.condition=1
                    exclusiveGroup: conditionGroup
                    enabled: pin.text=="0101"
                }
                RadioButton {
                    text: "Show Avatar with Neutral Faces"
                    onCheckedChanged: if(checked) window.condition=2
                    exclusiveGroup: conditionGroup
                    enabled: pin.text=="0101"
                }
                Button{
                    text: "Close"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: settings.visible=false
                }
            }

        }

    }


}

