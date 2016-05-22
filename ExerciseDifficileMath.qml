import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2

Item{
    id:root
    Timer{
        id:timer4loggingText
        interval: 5000
        property var currentObject
        onCurrentObjectChanged: stop()
        onRunningChanged: if(currentObject && running){
                              logger.write_general_action("Typing",currentObject.objectName)
                          }
    }
    function pullState(){
        root.enabled=!exDifficileStateMath.complete
        if(exDifficileStateMath.answer=="")
            answer_text.text="Ecrivez ici votre réponse"
        else
            answer_text.text=exDifficileStateMath.answer;
    }

    function pushState(){
        if(answer_text.text=="Ecrivez ici votre réponse")
            exDifficileStateMath.answer="";
        else
            exDifficileStateMath.answer=answer_text.text;
        exDifficileStateMath.writeState();
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        Text{
            Layout.fillWidth: true
            text:"Tu achètes six croissants fourrés à Fr. 1.30 la pièce, une tarte aux pommes à Fr. 5.20 et 2.5 kg de pain à Fr. 3.90 le kilo.<br>Combien paies-tu?"
            wrapMode: Text.WordWrap
            font.family: "Helvetica"
            fontSizeMode: Text.Fit;
            minimumPointSize: 12;
            font.pointSize: 14
        }

        RowLayout{
            spacing: 20
            Image{
                Layout.preferredWidth: root.width/3
                fillMode: Image.PreserveAspectFit
                source: "qrc:/exercices/exercises/bakery.png"
                Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
            }
            TextArea{
                id:answer_text
                Layout.preferredWidth: root.width/3
                text:"Ecrivez ici votre réponse"
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
                    exDifficileStateMath.complete=true;
                    pushState();
                    root.enabled=false;
                }
            }
        }
    }
}

