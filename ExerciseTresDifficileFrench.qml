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
        root.enabled=!exTresDifficileStateFrench.complete
        answer.text=exTresDifficileStateFrench.answer
    }

    function pushState(){
        exTresDifficileStateFrench.answer=answer.text
        exTresDifficileStateFrench.writeState();
    }
    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        Text{
            Layout.fillWidth: true
            text:"Ecris la suite de l’histoire."
            wrapMode: Text.WordWrap
            font.family: "Helvetica"
            font.pointSize: 14
            fontSizeMode: Text.Fit;
            minimumPointSize: 12;
        }
        TextArea{
            id:text_area
            Layout.fillWidth: true
            Layout.preferredHeight: 0.5*root.height
            text:"<b>La gare fantôme</b><br><i>    Simon roule en voiture avec son père en direction de Paris. Il est triste de quitter sa grand-mère qu’il ne voit qu’une fois par an.</i><br>    C’est bien un 2 janvier, comme il les a en horreur. Il pense à sa grand-mère qu’il laisse derrière lui. Il la revoit ce matin, saluant de la main leur départ, toute petite au balcon de son appartement. Il la revoit aussi fouillant pour lui dans ses vieilles photographies, au fond d’une valise en carton plus grande qu’elle. Il l’entend lui raconter sa jeunesse et son mari, le grand-père de Simon, mort bien longtemps avant d’avoir pu le connaître, quelque part dans le nord de la France, au début de la guerre.<br>    «Peut-être pas très loin de cette autoroute », songe Simon.<br>    La neige commence à tomber. Les essuie-glaces sont en panne. On n’y voit plus rien. La voiture s’immobilise sur la bande d’arrêt d’urgence.<br>Simon refuse de rester seul à l’intérieur tandis que son père sort pour lever le capot. Même si ce n’est pour un instant. Il ne se sent pas à l’aise dans cette voiture aux vitres couvertes de neige. Il sort.[…]"
            readOnly: true
            font.family: "Helvetica"
            font.pointSize: 12
            horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
            textFormat: TextEdit.RichText
        }
        TextArea{
            id:answer
            Layout.fillWidth: true
            Layout.fillHeight: true
            font.family: "Helvetica"
            font.pointSize: 12
            horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
            onActiveFocusChanged: if(activeFocus){
                                    timer4loggingText.currentObject=this;
                                    logger.write_general_action("Mouse_Select",objectName)
                                  }
            onTextChanged: timer4loggingText.start();
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
                    exTresDifficileStateFrench.complete=true;
                    pushState();
                    root.enabled=false;
                }
            }

        }
    }
}

