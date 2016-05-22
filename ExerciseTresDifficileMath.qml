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
        property var currentObject
        onCurrentObjectChanged: stop()
        onRunningChanged: if(currentObject && running){
                              logger.write_general_action("Typing",currentObject.objectName)
                          }
    }
    Timer{
        /*Differently from timer4loggingText, where the action is logged at the beginning of the typing,
        timer4loggingCalculations logs after 5 sec from the beginning of the typing.*/
        id:timer4loggingCalculations
        interval: 5000
        property string prev_text:"";
        onTriggered:
            if(myCanvas.text!=prev_text){
                logger.write_general_action("Typing","Area_Calculs:"+myCanvas.text)
                prev_text=myCanvas.text
            }
    }
    function pullState(){
        root.enabled=!exTresDifficileStateMath.complete
        a1.text=exTresDifficileStateMath.q1
        a2.text=exTresDifficileStateMath.q2
        a3.text=exTresDifficileStateMath.q3
        a4.text=exTresDifficileStateMath.q4
        a5.text=exTresDifficileStateMath.q5
        a6.text=exTresDifficileStateMath.q6
        a7.text=exTresDifficileStateMath.q7
        a8.text=exTresDifficileStateMath.q8
    }

    function pushState(){
        exTresDifficileStateMath.q1=a1.text
        exTresDifficileStateMath.q2=a2.text
        exTresDifficileStateMath.q3=a3.text
        exTresDifficileStateMath.q4=a4.text
        exTresDifficileStateMath.q5=a5.text
        exTresDifficileStateMath.q6=a6.text
        exTresDifficileStateMath.q7=a7.text
        exTresDifficileStateMath.q8=a8.text

        exTresDifficileStateMath.writeState();
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        Text{
            Layout.fillWidth: true
            text:"Place les nombres naturels de 10 à 17 dans les cercles, en sachant que deux nombres reliés par un trait n’ont pas le même nombre de diviseurs."
            wrapMode: Text.WordWrap
            font.family: "Helvetica"
            fontSizeMode: Text.Fit;
            minimumPointSize: 12;
            font.pointSize: 14
        }

        RowLayout{
            Image{
                Layout.preferredWidth: root.width/2
                Layout.fillHeight: true
                Layout.topMargin: 20
                Layout.bottomMargin: 20
                fillMode: Image.PreserveAspectFit
                source: "qrc:/exercises/exTresDifficileMath.png"
                Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                Item{
                    anchors.centerIn: parent
                    width: parent.paintedWidth
                    height: parent.paintedHeight
                    property real ratio:width/554
                    Item{
                        x:20*parent.ratio
                        y:150*parent.ratio
                        width: 100*parent.ratio
                        height: 100*parent.ratio
                        TextField{
                            id:a1
                            font.family: "Helvetica"
                            font.pointSize: 12
                            anchors.centerIn: parent
                            width: parent.width*0.6
                            height: width
                            horizontalAlignment:TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            placeholderText:"*"
                            objectName: "Question_1"
                            onActiveFocusChanged: if(activeFocus){
                                                    timer4loggingText.currentObject=this;
                                                    logger.write_general_action("Mouse_Select",objectName)
                                                  }
                            onTextChanged: timer4loggingText.start();
                        }
                    }
                    Item{
                        x:92*parent.ratio
                        y:20*parent.ratio
                        width: 100*parent.ratio
                        height: 100*parent.ratio
                        TextField{
                            id:a2
                            font.family: "Helvetica"
                            font.pointSize: 12
                            anchors.centerIn: parent
                            width: parent.width*0.6
                            height: width
                            horizontalAlignment:TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            placeholderText:"*"
                            objectName: "Question_2"
                            onActiveFocusChanged: if(activeFocus){
                                                    timer4loggingText.currentObject=this;
                                                    logger.write_general_action("Mouse_Select",objectName)
                                                  }
                            onTextChanged: timer4loggingText.start();
                        }
                    }
                    Item{
                        x:92*parent.ratio
                        y:275*parent.ratio
                        width: 100*parent.ratio
                        height: 100*parent.ratio
                        TextField{
                            id:a3
                            font.family: "Helvetica"
                            font.pointSize: 12
                            anchors.centerIn: parent
                            width: parent.width*0.6
                            height: width
                            horizontalAlignment:TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            placeholderText:"*"
                            objectName: "Question_3"
                            onActiveFocusChanged: if(activeFocus){
                                                    timer4loggingText.currentObject=this;
                                                    logger.write_general_action("Mouse_Select",objectName)
                                                  }
                            onTextChanged: timer4loggingText.start();
                        }
                    }
                    Item{
                        x:155*parent.ratio
                        y:150*parent.ratio
                        width: 100*parent.ratio
                        height: 100*parent.ratio
                        TextField{
                            id:a4
                            font.family: "Helvetica"
                            font.pointSize: 12
                            anchors.centerIn: parent
                            width: parent.width*0.6
                            height: width
                            horizontalAlignment:TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            placeholderText:"*"
                            objectName: "Question_4"
                            onActiveFocusChanged: if(activeFocus){
                                                    timer4loggingText.currentObject=this;
                                                    logger.write_general_action("Mouse_Select",objectName)
                                                  }
                            onTextChanged: timer4loggingText.start();
                        }
                    }
                    Item{
                        x:292*parent.ratio
                        y:150*parent.ratio
                        width: 100*parent.ratio
                        height: 100*parent.ratio
                        TextField{
                            id:a5
                            font.family: "Helvetica"
                            font.pointSize: 12
                            anchors.centerIn: parent
                            width: parent.width*0.6
                            height: width
                            horizontalAlignment:TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            placeholderText:"*"
                            objectName: "Question_5"
                            onActiveFocusChanged: if(activeFocus){
                                                    timer4loggingText.currentObject=this;
                                                    logger.write_general_action("Mouse_Select",objectName)
                                                  }
                            onTextChanged: timer4loggingText.start();
                        }
                    }
                    Item{
                        x:350*parent.ratio
                        y:20*parent.ratio
                        width: 100*parent.ratio
                        height: 100*parent.ratio
                        TextField{
                            id:a6
                            font.family: "Helvetica"
                            font.pointSize: 12
                            anchors.centerIn: parent
                            width: parent.width*0.6
                            height: width
                            horizontalAlignment:TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            placeholderText:"*"
                            objectName: "Question_6"
                            onActiveFocusChanged: if(activeFocus){
                                                    timer4loggingText.currentObject=this;
                                                    logger.write_general_action("Mouse_Select",objectName)
                                                  }
                            onTextChanged: timer4loggingText.start();
                        }
                    }
                    Item{
                        x:350*parent.ratio
                        y:275*parent.ratio
                        width: 100*parent.ratio
                        height: 100*parent.ratio
                        TextField{
                            id:a7
                            font.family: "Helvetica"
                            font.pointSize: 12
                            anchors.centerIn: parent
                            width: parent.width*0.6
                            height: width
                            horizontalAlignment:TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            placeholderText:"*"
                            objectName: "Question_7"
                            onActiveFocusChanged: if(activeFocus){
                                                    timer4loggingText.currentObject=this;
                                                    logger.write_general_action("Mouse_Select",objectName)
                                                  }
                            onTextChanged: timer4loggingText.start();
                        }
                    }
                    Item{
                        x:430*parent.ratio
                        y:150*parent.ratio
                        width: 100*parent.ratio
                        height: 100*parent.ratio
                        TextField{
                            id:a8
                            font.family: "Helvetica"
                            font.pointSize: 12
                            anchors.centerIn: parent
                            width: parent.width*0.6
                            height: width
                            horizontalAlignment:TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            placeholderText:"*"
                            objectName: "Question_8"
                            onActiveFocusChanged: if(activeFocus){
                                                    timer4loggingText.currentObject=this;
                                                    logger.write_general_action("Mouse_Select",objectName)
                                                  }
                            onTextChanged: timer4loggingText.start();
                        }
                    }

                }
            }
            Rectangle {
                id:canvas_container
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 20
                Text{
                    id:bb_text
                    width: parent.width
                    text:"Ceci est un espace pour tes calculs"
                    font.family: "Helvetica"
                    fontSizeMode: Text.Fit;
                    minimumPointSize: 8;
                    font.pointSize: 12
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top:parent.top
                    anchors.margins: 2
                }


                TextArea {
                    id: myCanvas
                    font.pointSize: 12
                    anchors.top:bb_text.bottom
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    onActiveFocusChanged: if(activeFocus){
                                            logger.write_general_action("Mouse_Select","Area_Calculs")
                                          }
                    onTextChanged: timer4loggingCalculations.start();
                }


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
                    exTresDifficileStateMath.complete=true;
                    pushState();
                    root.enabled=false;
                }
            }
        }
    }
}

