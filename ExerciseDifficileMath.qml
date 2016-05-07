import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2

Item{
    id:root

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
            spacing: 10
            TextArea{
                id:answer_text
                Layout.preferredWidth: root.width/3
                text:"Ecrivez ici votre réponse"
                font.family: "Helvetica"
                font.pointSize: 12
                horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
            }
            Rectangle {
                id:canvas_container
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 20
                Text{
                    id:bb_text
                    width: parent.width
                    text:"Ceci est un espace pour vos calculs"
                    font.family: "Helvetica"
                    fontSizeMode: Text.Fit;
                    minimumPointSize: 8;
                    font.pointSize: 12
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top:parent.top
                    anchors.margins: 2
                }

                Canvas {
                    id: myCanvas
                    anchors.top:bb_text.bottom
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                    property int mode:1;
                    Path {
                           id: myPath
                           startX: -1; startY: -1
                           PathCurve{
                                id:path_curve
                           }
                    }
                    onPaint: {
                        var ctx = getContext('2d')
                        if(mode==1){
                            ctx.strokeStyle = Qt.rgba(.4,.6,.8);
                            ctx.lineWidth=2;
                        }
                        else{
                            ctx.strokeStyle = Qt.rgba(1,1,1);
                            ctx.lineWidth=20;
                        }
                        ctx.path = myPath;
                        ctx.stroke();
                        myPath.startX=path_curve.x;
                        myPath.startY=path_curve.y
                    }

                    MouseArea{
                        anchors.fill: parent
                        onPressed: {
                            myPath.startX = mouseX
                            myPath.startY = mouseY
                        }
                        onMouseXChanged: {

                            if(myPath.startX==-1){
                               myPath.startX=mouseX;
                               myPath.startY=mouseY;
                            }
                            else{
                                path_curve.x=mouseX;
                                path_curve.y=mouseY;
                                myCanvas.requestPaint()
                            }

                        }
                        onMouseYChanged: {

                            if(myPath.startX==-1){
                               myPath.startX=mouseX;
                               myPath.startY=mouseY;
                            }
                            else{
                                path_curve.x=mouseX;
                                path_curve.y=mouseY;
                                myCanvas.requestPaint()
                            }
                        }
                    }

                    Rectangle{
                        width: 50
                        height: 50
                        anchors.bottom: parent.bottom
                        anchors.right: eraser.left
                        border.color: myCanvas.mode==1 ? "#0000FF":"white"
                        border.width: 2
                        Image {
                            anchors.fill: parent
                            source: "qrc:/brush.png"
                            MouseArea{
                                anchors.fill: parent
                                onClicked: myCanvas.mode=1
                            }
                        }
                    }
                    Rectangle{
                        id:eraser
                        width: 50
                        height: 50
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        border.color: myCanvas.mode==2 ? "#0000FF":"white"
                        border.width: 2
                        Image {
                            anchors.fill: parent
                            source: "qrc:/eraser.png"
                            MouseArea{
                                anchors.fill: parent
                                onClicked: myCanvas.mode=2
                            }
                        }
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
                    exDifficileStateMath.complete=true;
                    pushState();
                    root.enabled=false;
                }
            }
        }
    }
}

