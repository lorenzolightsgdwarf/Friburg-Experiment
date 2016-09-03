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

    MessageDialog{
        id:dialog
        visible:false;
        icon: StandardIcon.Question
        modality:Qt.ApplicationModal
        standardButtons: StandardButton.Ok
        title:"Instruction"
        text:"Saisis ton code s'il vous plaît"
        onAccepted:{
            visible=false
        }
    }

    Rectangle{
        id:welcome
        color:"#2196f3"
        width: Math.min(parent.width,height)
        height: parent.height-20
        anchors.centerIn: parent
        anchors.margins: 10
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
        }
        Rectangle{
            anchors.fill: parent
            anchors.margins: 10
            color:"#2962ff"
            MouseArea{
                enabled: !settings.visible
                anchors.fill: parent
                onClicked: {
                    if(student_code.text.length<=0){
                        dialog.visible=true;
                    }
                    else{
                    if(window.condition==0)
                        logger.write_read_instruction("",student_code.text)
                    else if(window.condition==1)
                        logger.write_read_instruction("Maths",student_code.text)
                    else if(window.condition==2)
                        logger.write_read_instruction("French",student_code.text)
                    welcome.visible=false;
                    instruction.visible=true}
                }
            }
            Column{
                anchors.centerIn: parent
                spacing: 10
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Bienvenue!<br>Cliquer pour commencer"
                color:"white"
                horizontalAlignment:Text.AlignHCenter
                font.family: "Helvetica"
                fontSizeMode: Text.Fit;
                minimumPointSize: 12;
                font.pointSize: 24
                antialiasing: true

            }
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text:"Saisis ton code :"
                color:"white"
                horizontalAlignment:Text.AlignHCenter
                font.family: "Helvetica"
                fontSizeMode: Text.Fit;
                minimumPointSize: 12;
                font.pointSize: 15;
            }
            TextField{
                id:student_code
                anchors.horizontalCenter: parent.horizontalCenter
            }
            }
            Rectangle{
                visible: false
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
                    verticalOffset: 2
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
        color:"#2196f3"
        width: Math.min(parent.width,height)
        height: parent.height-20
        anchors.centerIn: parent
        anchors.margins: 10
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
        }
        Rectangle{
            anchors.fill: parent
            anchors.margins: 10
            color:"#2962ff"
            ColumnLayout{
                id:instruction_zone
                spacing: 10
                anchors.fill: parent
                anchors.margins: 20
                Text{
                    id:title
                    text:"<b><center>Consignes</center></b><br><ul><li>Réalise les 4 exercices proposés, dans l’ordre qui te convient</li>
<br><li>Lorsque tu auras terminé les exercices, clique sur le bouton <i>Déconnexion</i>.</li></ul>"
                    color: "white"
                    wrapMode: Text.WordWrap
                    font.family: "Helvetica"
                    fontSizeMode: Text.Fit;
                    minimumPointSize: 12;
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
                            verticalOffset: 2
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
                    onCheckedChanged: if(checked) window.condition=0
                    enabled: pin.text=="0101"
                    exclusiveGroup: conditionGroup
                }
                RadioButton {
                    text: "Show Avatar with Faces"
                    checked: true
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

