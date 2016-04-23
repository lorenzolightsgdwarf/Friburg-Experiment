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
            exFacileState.complete=true;
            pushState();
            root.enabled=false;
            visible=false}
    }

    function pullState(){
        root.enabled=!exFacileState.complete
        var i=0;
        for(i=0;i<answers_repeter.count;i++){
            answers_repeter.itemAt(i).text=exFacileState.answers[i];
        }
    }

    function pushState(){
        exFacileState.answers=[]
        var i;
        for(i=0;i<answers_repeter.count;i++){
            exFacileState.answers.push(answers_repeter.itemAt(i).text);
        }
        exFacileState.writeState();
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        Text{
            Layout.fillWidth: true
            text:"Lis le texte, repère tous les antonymes qui s’y trouvent, et écris-les dans le tableau ci-dessous. Pour rappel, les <b>antonymes</b> sont des mots de la même classe grammaticale qui sont opposés par leur sens."
            wrapMode: Text.WordWrap
            font.family: "Helvetica"
            font.pointSize: 14
            fontSizeMode: Text.Fit;
            minimumPointSize: 12;
        }
        TextArea{
            id:text_area
            Layout.fillWidth: true
            text:"«Lorsque le jour se leva, Fanny était encore étendue sur le sol rugueux. La petite fille ignorait où elle se trouvait. Elle ferma alors les yeux en s’efforçant de se remémorer les événements de la nuit. Rien ne lui vint à l’esprit sinon une silhouette s’approchant d’elle. Une silhouette familière, aux cheveux roux et lisses. Un homme, une femme ? Le souvenir s’éloigna aussitôt, à grandes enjambées. Elle n’était pas effrayée, juste étonnée de se réveiller dehors, alors qu’elle s’était endormie à l’abri du ciel étoilé. Etonnée aussi de constater que son ami, le garçon au chapeau vert, avait disparu. Toute idée de tristesse lui était étrangère pourtant, car elle savait que les contes se terminaient toujours dans la liesse, nains et géants s’unissant à jamais.»"
            readOnly: true
            font.family: "Helvetica"
            font.pointSize: 12

            horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
        }
        ScrollView{
            id: scrollView1
            Layout.fillHeight: true
            Layout.fillWidth: true
            horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
            GridLayout{
                width: text_area.width
                columns: 2
                Text { text: "<b>Mot</b>";Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter }
                Text { text: "<b>Mot de sens inverse</b>";Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter }
                Text { text: "Ex : le jour";Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter }
                Text { text: "Ex : la nuit";Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter }
                Repeater {
                    id:answers_repeter
                    model:20
                    TextField{Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter}
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
                font.bold: true
                fontSizeMode: Text.Fit;
                minimumPointSize: 12;
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: termine_dialog.visible=true;
            }

        }
    }
}

