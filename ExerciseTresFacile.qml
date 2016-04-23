import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2

Item{
    id:root

    MessageDialog{
        id:termine_dialog
        visible:false;
        icon: StandardIcon.Question
        modality:Qt.ApplicationModal
        standardButtons: StandardButton.Abort | StandardButton.Ok
        title:"Exercice terminé"
        text:"Es-tu sûr de vouloir te terminé l'exercice?<br>Vous ne pourrez modifier vos réponses"
        onRejected:{visible=false}
        onAccepted:{
            exTresFacileState.complete=true;
            pushState();
            root.enabled=false;
            visible=false
        }
    }

    function pullState(){
        root.enabled=!exTresFacileState.complete
        q1.text=exTresFacileState.q1
        q2.text=exTresFacileState.q2
        q3.text=exTresFacileState.q3
        q4.text=exTresFacileState.q4
        q5.text=exTresFacileState.q5
        q6.text=exTresFacileState.q6
    }

    function pushState(){
        exTresFacileState.q1=q1.text
        exTresFacileState.q2=q2.text
        exTresFacileState.q3=q3.text
        exTresFacileState.q4=q4.text
        exTresFacileState.q5=q5.text
        exTresFacileState.q6=q6.text
        exTresFacileState.writeState();
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
                onClicked: termine_dialog.visible=true;
            }

        }
    }
}

