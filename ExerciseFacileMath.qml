import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2

Item{
    id:root
    Timer{
        id:timer4loggingText
        interval: 5000
        running: false
        property var currentObject
        onCurrentObjectChanged: stop()
        onRunningChanged: if(currentObject && running){
                              logger.write_general_action("Typing",currentObject.objectName)
                          }
    }
    function pullState(){
        root.enabled=!exFacileStateMath.complete
        answer_text.text=exFacileStateMath.answer;
    }

    function pushState(){
        exFacileStateMath.answer=answer_text.text;
        exFacileStateMath.writeState();
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        Text{
            Layout.fillWidth: true
            text:"Une horloge avance de 15 secondes par heure.<br>On la met à l’heure à 20 heures.<br>Quelle heure indiquera-t-elle, le lendemain lorsqu’il sera précisément 20 heures ?"
            wrapMode: Text.WordWrap
            font.family: "Helvetica"
            fontSizeMode: Text.Fit;
            minimumPointSize: 12;
            font.pointSize: 14
        }

        RowLayout{
            Image{
                Layout.preferredWidth: root.width/3
                fillMode: Image.PreserveAspectFit
                source: "qrc:/exercices/exercises/clock.png"
                Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
            }
            TextArea{
                id:answer_text
                Layout.preferredWidth: root.width/3
                text:""
                font.family: "Helvetica"
                font.pointSize: 12
                horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
                onActiveFocusChanged: if(activeFocus){
                                        timer4loggingText.currentObject=this;
                                        logger.write_general_action("Mouse_Select",objectName)
                                      }
                onTextChanged: timer4loggingText.start();
            }
        }


        Rectangle{
            color:"#e91e63"
            Layout.preferredHeight: text_temine.height+10
            Layout.preferredWidth: text_temine.width+10
            radius: 10
            Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
            }
            Text{
                id:text_temine
                text:"Exercice terminé"
                font.family: "Helvetica"
                font.pointSize: 16
                fontSizeMode: Text.Fit;
                minimumPointSize: 12;
                font.bold: true
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    exFacileStateMath.complete=true;
                    pushState();
                    root.enabled=false;
                }
            }
        }
    }
}

