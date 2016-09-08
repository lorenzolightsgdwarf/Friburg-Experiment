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
        root.enabled=!exBlackStep2State.complete
        answer.text=exBlackStep2State.answer
    }

    function pushState(){
        exBlackStep2State.answer=answer.text
        exBlackStep2State.writeState();
    }
    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        Text{
            Layout.fillWidth: true
            text:"Ecris la suite de l’histoire. 5 lignes au maximum."
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
            text:"<b>Un pacte pour la vie</b><br><i>Fabian, après s’être disputé avec son ami Alex, a grimpé au sommet d’un rocher et ne veut plus en bouger.</i><br>– Fabian?<br>Je tressaille. La voix de ma mère paraît tomber du ciel. Elle se tient sur la falaise qui domine le rocher, à deux mètres au-dessus de moi. Pour arriver, elle a dû contourner tout le village, jusqu’au terrain de foot. C’est le seul endroit d’où l’on peut gagner la forêt sans être vu. Elle ne voulait pas qu’on l’aperçoive de la route, c’est clair. Maintenant, elle s’appuie contre un pin pour reprendre son souffle. Je lui lance:<br>– Qu’est-ce qu’il y a encore?<br>C’est la troisième fois qu’elle rapplique, depuis le début de l’après-midi.<br>Les deux premières, elle a essayé de me raisonner d’en bas comme le pasteur tout à l’heure.<br>– Descends. Le soir tombe.<br>– J’ai pas envie.<br>– La mère d’Alex n’est plus fâchée contre toi.<br>– La mère d’Alex, elle peut aller...<br>– Si tu n’es pas en bas dans une heure, j’appelle les pompiers! Il n’est pas question que tu descendes tout seul dans le noir.<br>– Je ne descendrai pas, ni dans le noir ni autrement. Je reste ici.<br>– Je peux enfin savoir pourquoi?<br>– L’air est meilleur, ici.<br>J’inspire à fond et je souffle. Exprès."
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
                    exBlackStep2State.complete=true;
                    pushState();
                    root.enabled=false;
                }
            }

        }
    }
}

