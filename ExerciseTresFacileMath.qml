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

    function pullState(){
        root.enabled=!exTresFacileStateMath.complete
        q1.text=exTresFacileStateMath.q1
        q2.text=exTresFacileStateMath.q2
        q3.text=exTresFacileStateMath.q3
        q4.text=exTresFacileStateMath.q4
        q5.text=exTresFacileStateMath.q5
        q6.text=exTresFacileStateMath.q6
    }

    function pushState(){
        exTresFacileStateMath.q1=q1.text
        exTresFacileStateMath.q2=q2.text
        exTresFacileStateMath.q3=q3.text
        exTresFacileStateMath.q4=q4.text
        exTresFacileStateMath.q5=q5.text
        exTresFacileStateMath.q6=q6.text
        exTresFacileStateMath.writeState();
    }


    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        Text{
            Layout.fillWidth: true
            text:"Pour chacune des figures ci-dessous, indique la fraction coloriée."
            wrapMode: Text.WordWrap
            font.family: "Helvetica"
            font.pointSize: 14
            fontSizeMode: Text.Fit;
            minimumPointSize: 12;
        }
        ScrollView{
            id: scrollView1
            Layout.fillHeight: true
            Layout.fillWidth: true
            horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
            GridLayout{
                width: 0.8*root.width
                columns: 2
                ColumnLayout{
                    Layout.preferredWidth: 0.5*parent.width
                    Image{
                        Layout.fillWidth: true
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/exercices/exercises/ex_tres_facile/image001.png"
                    }
                    Text{
                        text:"Ex. 2/4"
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                    }
                }
                ColumnLayout{
                    Layout.preferredWidth: 0.5*parent.width
                    Image{
                        Layout.fillWidth: true
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/exercices/exercises/ex_tres_facile/image003.png"
                    }
                    TextField{
                        id:q1
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                        objectName: "Fraction_1"
                        onActiveFocusChanged: if(activeFocus){
                                                timer4loggingText.currentObject=this;
                                                logger.write_general_action("Mouse_Select",objectName)
                                              }
                        onTextChanged: timer4loggingText.start();
                    }
                }
                ColumnLayout{
                    Layout.preferredWidth: 0.5*parent.width
                    Image{
                        Layout.fillWidth: true
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/exercices/exercises/ex_tres_facile/image005.png"
                    }
                    TextField{
                        id:q2
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                        objectName: "Fraction_2"
                        onActiveFocusChanged: if(activeFocus){
                                                timer4loggingText.currentObject=this;
                                                logger.write_general_action("Mouse_Select",objectName)
                                              }
                        onTextChanged: timer4loggingText.start();
                    }
                }
                ColumnLayout{
                    Layout.preferredWidth: 0.5*parent.width
                    Image{
                        Layout.fillWidth: true
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/exercices/exercises/ex_tres_facile/image007.png"
                    }
                    TextField{
                        id:q3
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                        objectName: "Fraction_3"
                        onActiveFocusChanged: if(activeFocus){
                                                timer4loggingText.currentObject=this;
                                                logger.write_general_action("Mouse_Select",objectName)
                                              }
                        onTextChanged: timer4loggingText.start();
                    }
                }
                ColumnLayout{
                    Layout.preferredWidth: 0.5*parent.width
                    Image{
                        Layout.fillWidth: true
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/exercices/exercises/ex_tres_facile/image009.png"
                    }
                    TextField{
                        id:q4
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                        objectName: "Fraction_4"
                        onActiveFocusChanged: if(activeFocus){
                                                timer4loggingText.currentObject=this;
                                                logger.write_general_action("Mouse_Select",objectName)
                                              }
                        onTextChanged: timer4loggingText.start();
                    }
                }
                ColumnLayout{
                    Layout.preferredWidth: 0.5*parent.width
                    Image{
                        Layout.fillWidth: true
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/exercices/exercises/ex_tres_facile/image011.png"
                    }
                    TextField{
                        id:q5
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                        objectName: "Fraction_5"
                        onActiveFocusChanged: if(activeFocus){
                                                timer4loggingText.currentObject=this;
                                                logger.write_general_action("Mouse_Select",objectName)
                                              }
                        onTextChanged: timer4loggingText.start();
                    }
                }
                ColumnLayout{
                    Layout.preferredWidth: 0.5*parent.width
                    Image{
                        Layout.fillWidth: true
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/exercices/exercises/ex_tres_facile/image013.png"
                    }
                    TextField{
                        id:q6
                        Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                        objectName: "Fraction_6"
                        onActiveFocusChanged: if(activeFocus){
                                                timer4loggingText.currentObject=this;
                                                logger.write_general_action("Mouse_Select",objectName)
                                              }
                        onTextChanged: timer4loggingText.start();
                    }
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
                    exTresFacileStateMath.complete=true;
                    pushState();
                    root.enabled=false;
                }
            }

        }
    }
}

