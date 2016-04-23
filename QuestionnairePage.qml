import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Rectangle{
    id:final_questions
    anchors.fill: parent
    color:"#e3f2fd"

    function checkMissingFields(){
        if(!agegroup.current){
            dialog.text="Remplissez le champ: <b>Age</b>"
            dialog.visible=true
             return false;

        }
        if(!sexgroup.current){
            dialog.text="Remplissez le champ: <b>Sexe</b>"
            dialog.visible=true
             return false;

        }
        if(!francegroup.current || (francegroup.current.text=="Autre" && franceniveau_autre.text.length==0)){
            dialog.text="Remplissez le champ: <b>Niveau en français</b>"
            dialog.visible=true
             return false;

        }
        if(!mathematiques.current || (mathematiques.current.text=="Autre" && mathematiquesniveau_autre.text.length==0)){
            dialog.text="Remplissez le champ: <b>Niveau en mathématiques</b>"
            dialog.visible=true
             return false;

        }
        if(!allemand.current || (allemand.current.text=="Autre" && allemandniveau_autre.text.length==0)){
            dialog.text="Remplissez le champ: <b>Niveau en allemand</b>"
            dialog.visible=true
             return false;

        }
        if(!sciences.current || (sciences.current.text=="Autre" && sciencesniveau_autre.text.length==0)){
            dialog.text="Remplissez le champ: <b>Niveau en sciences</b>"
            dialog.visible=true
             return false;

        }
        if(!penses_france.current){
            dialog.text="Remplissez le champ: <b>Que penses-tu du français?</b>"
            dialog.visible=true
             return false;

        }
        if(!penses_mathematiques.current){
            dialog.text="Remplissez le champ: <b>Que penses-tu du mathématiques?</b>"
            dialog.visible=true
             return false;

        }
        if(!ordinateur.current){
            dialog.text="Remplissez le champ: <b>A quelle fréquence utilises-tu l’ordinateur, le smartphone ou d’autres appareils pour communiquer avec les autres, sur une échelle de 1 à 10?</b>"
            dialog.visible=true
             return false;

        }
        if(!revenons_fractions.current){
            dialog.text="Remplissez le champ: <b>Revenons aux l’exercice de maths sur les fractions que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant?</b>"
            dialog.visible=true
             return false;

        }
        if(!revenons_horloge.current){
            dialog.text="Remplissez le champ: <b>Revenons aux l’exercice de maths au sujet de l’horloge que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant?</b>"
            dialog.visible=true
             return false;

        }
        if(!revenons_antonymes.current){
            dialog.text="Remplissez le champ: <b>Revenons aux l’exercice de français sur les antonymes que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant?</b>"
            dialog.visible=true
             return false;

        }
        if(!revenons_lire.current){
            dialog.text="Remplissez le champ: <b>Revenons aux l’exercice de français sur les débuts de texte à lire que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant?</b>"
            dialog.visible=true
             return false;
        }
        return true;

    }

    MessageDialog{
        id:dialog
        visible:false;
        icon: StandardIcon.Question
        modality:Qt.ApplicationModal
        standardButtons: StandardButton.Ok
        title:"Questionnaire"
        text:"Remplissez le champ: "
        onAccepted:{
            visible=false
        }
    }
    MessageDialog{
        id:exit_dialog
        visible:false;
        modality:Qt.ApplicationModal
        standardButtons: StandardButton.Ok
        title:"Merci"
        text:"Merci pour votre participation!"
        onAccepted:{
            Qt.quit()
        }
    }

    Rectangle{
        width: 3/4*parent.height
        height: parent.height-20
        anchors.centerIn: parent
        anchors.margins: 10
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
        }
        Rectangle{
            id:questionnaire_title
            color:"#2962ff"
            width: parent.width
            height: 75
            Label{
                anchors.fill: parent
                anchors.margins: 10
                anchors.verticalCenter: parent.verticalCenter
                text:"Questionnaire Final"
                color: "white"
                fontSizeMode: Text.Fit
                minimumPixelSize: 10; font.pixelSize: 35
            }
        }
        Item{
            id:list_item
            anchors.top: questionnaire_title.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: questionnaire_done_button.top
            anchors.topMargin: 20
            anchors.leftMargin: 20
            ScrollView{
                anchors.fill: parent
                horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
                ColumnLayout{
                    width: list_item.width
                    anchors.margins: 20
                    spacing: 10
                    /*-----Age-----*/
                    Label{
                        Layout.maximumWidth: list_item.width-30
                        text: "Age:"
                        font.bold: true
                        font.pointSize: 14
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        wrapMode: Text.WordWrap
                    }
                    ExclusiveGroup { id: agegroup }
                    Column{
                        leftPadding: 10
                        RadioButton {
                            text: "13"
                            exclusiveGroup: agegroup
                        }
                        RadioButton {
                            text: "14"
                            exclusiveGroup: agegroup
                        }
                        RadioButton {
                            text: "15"
                            exclusiveGroup: agegroup
                        }
                        RadioButton {
                            text: "16"
                            exclusiveGroup: agegroup
                        }
                    }
                    /*-------*/

                    Label{
                        Layout.maximumWidth: list_item.width-30
                        text: "Sexe:"
                        font.bold: true
                        font.pointSize: 14
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        wrapMode: Text.WordWrap

                    }
                    ExclusiveGroup { id: sexgroup }
                    Column{
                        leftPadding: 10
                        RadioButton {
                            text: "Garçon"
                            exclusiveGroup: sexgroup
                        }
                        RadioButton {
                            text: "Fille"
                            exclusiveGroup: sexgroup
                        }
                    }
                    /*-------*/
                    Label{
                        Layout.maximumWidth: list_item.width-30
                        text: "Niveau scolaire:"
                        font.bold: true
                        font.pointSize: 14
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        wrapMode: Text.WordWrap
                    }
                    Column{
                        leftPadding: 10
                        spacing: 10
                        Label{
                            Layout.maximumWidth: list_item.width-30
                            text: "En français:"
                            font.italic: true
                            font.pointSize: 12
                            fontSizeMode: Text.Fit;
                            minimumPointSize: 12;
                            wrapMode: Text.WordWrap
                        }
                        ExclusiveGroup { id: francegroup }
                        Column{
                            leftPadding: 10
                            RadioButton {
                                text: "Niveau 1"
                                exclusiveGroup: francegroup
                            }
                            RadioButton {
                                text: "Niveau 2"
                                exclusiveGroup: francegroup
                            }
                            RadioButton {
                                text: "Autre"
                                exclusiveGroup: francegroup
                                TextField{
                                    id:franceniveau_autre
                                    enabled: parent.checked
                                    text:""
                                    anchors.left: parent.right
                                    anchors.leftMargin: 5
                                }
                            }
                        }
                    }
                    /*-------*/
                    Column{
                        leftPadding: 10
                        spacing: 10
                        Label{
                            Layout.maximumWidth: list_item.width-30

                            text: "En mathématiques:"
                            font.italic: true
                            fontSizeMode: Text.Fit;
                            minimumPointSize: 12;
                            font.pointSize: 12
                            wrapMode: Text.WordWrap
                        }

                        ExclusiveGroup { id: mathematiques }
                        Column{
                            leftPadding: 10
                            RadioButton {
                                text: "Niveau 1"
                                exclusiveGroup: mathematiques
                            }
                            RadioButton {
                                text: "Niveau 2"
                                exclusiveGroup: mathematiques
                            }
                            RadioButton {
                                text: "Autre"
                                exclusiveGroup: mathematiques
                                TextField{
                                    enabled: parent.checked
                                    id:mathematiquesniveau_autre
                                    anchors.left: parent.right
                                    anchors.leftMargin: 5

                                }
                            }
                        }
                    }
                    /*-------*/
                    Column{
                        leftPadding: 10
                        spacing: 10
                        Label{
                            Layout.maximumWidth: list_item.width-30
                            text: "En allemand:"
                            font.italic: true
                            fontSizeMode: Text.Fit;
                            minimumPointSize: 12;
                            font.pointSize: 12
                            wrapMode: Text.WordWrap
                        }
                        ExclusiveGroup { id: allemand }
                        Column{
                            leftPadding: 10
                            RadioButton {
                                text: "Niveau 1"
                                exclusiveGroup: allemand
                            }
                            RadioButton {
                                text: "Niveau 2"
                                exclusiveGroup: allemand
                            }
                            RadioButton {
                                text: "Autre"
                                exclusiveGroup: allemand
                                TextField{
                                    enabled: parent.checked
                                    id:allemandniveau_autre
                                    anchors.left: parent.right
                                    anchors.leftMargin: 5

                                }
                            }
                        }
                    }
                    /*-------*/
                    Column{
                        leftPadding: 10
                        spacing: 10
                        Label{
                            Layout.maximumWidth: list_item.width-30
                            text: "En sciences:"
                            font.italic: true
                            font.pointSize: 12
                            fontSizeMode: Text.Fit;
                            minimumPointSize: 12;
                            wrapMode: Text.WordWrap
                        }
                        ExclusiveGroup { id: sciences }
                        Column{
                            leftPadding: 10
                            RadioButton {
                                text: "Niveau 1"
                                exclusiveGroup: sciences
                            }
                            RadioButton {
                                text: "Niveau 2"
                                exclusiveGroup: sciences
                            }
                            RadioButton {
                                text: "Autre"
                                exclusiveGroup: sciences
                                TextField{
                                    enabled: parent.checked
                                    id:sciencesniveau_autre
                                    anchors.left: parent.right
                                    anchors.leftMargin: 5

                                }
                            }
                        }
                    }
                    /*-------*/
                    Label{
                        Layout.maximumWidth: list_item.width-30
                        text: "Que penses-tu du français ?"
                        font.bold: true
                        font.pointSize: 14
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        wrapMode: Text.WordWrap
                    }
                    ExclusiveGroup { id: penses_france }
                    Column{
                        leftPadding: 10
                        RadioButton {
                            text: "J’aime beaucoup"
                            exclusiveGroup: penses_france
                        }
                        RadioButton {
                            text: "J’aime un peu"
                            exclusiveGroup: penses_france
                        }
                        RadioButton {
                            text: "Je n’aime pas trop"
                            exclusiveGroup: penses_france
                        }
                        RadioButton {
                            text: "Je n’aime pas du tout"
                            exclusiveGroup: penses_france
                        }
                    }
                    /*-------*/
                    Label{
                        Layout.maximumWidth: list_item.width-30
                        text: "Que penses-tu des mathématiques?"
                        font.bold: true
                        font.pointSize: 14
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        wrapMode: Text.WordWrap
                    }
                    ExclusiveGroup { id: penses_mathematiques }
                    Column{
                        leftPadding: 10
                        RadioButton {
                            text: "J’aime beaucoup"
                            exclusiveGroup: penses_mathematiques
                        }
                        RadioButton {
                            text: "J’aime un peu"
                            exclusiveGroup: penses_mathematiques
                        }
                        RadioButton {
                            text: "Je n’aime pas trop"
                            exclusiveGroup: penses_mathematiques
                        }
                        RadioButton {
                            text: "Je n’aime pas du tout"
                            exclusiveGroup: penses_mathematiques
                        }
                    }
                    /*-------*/
                    Label{
                        Layout.maximumWidth: list_item.width-30
                        text: "A quelle fréquence utilises-tu l’ordinateur, le smartphone ou d’autres appareils pour communiquer avec les autres, sur une échelle de 1 à 10?"
                        font.bold: true
                        font.pointSize: 14
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        wrapMode: Text.WordWrap

                    }
                    Label{
                        Layout.maximumWidth: list_item.width-30
                        text:"Le chiffre 1 correspond à une fréquence de connexion minimale et le chiffre 10 correspond à une fréquence maximale."
                        font.italic: true
                        font.pointSize: 12
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        wrapMode: Text.WordWrap

                    }
                    ExclusiveGroup { id: ordinateur }
                    Row{
                        spacing: 5
                        leftPadding: 10
                        RadioButton {
                            text: "1"
                            exclusiveGroup: ordinateur
                        }
                        RadioButton {
                            text: "2"
                            exclusiveGroup: ordinateur
                        }
                        RadioButton {
                            text: "3"
                            exclusiveGroup: ordinateur
                        }
                        RadioButton {
                            text: "4"
                            exclusiveGroup: ordinateur
                        }
                        RadioButton {
                            text: "5"
                            exclusiveGroup: ordinateur
                        }
                    }
                    Row{
                        spacing: 5
                        leftPadding: 10
                        RadioButton {
                            text: "6"
                            exclusiveGroup: ordinateur
                        }
                        RadioButton {
                            text: "7"
                            exclusiveGroup: ordinateur
                        }
                        RadioButton {
                            text: "8"
                            exclusiveGroup: ordinateur
                        }
                        RadioButton {
                            text: "9"
                            exclusiveGroup: ordinateur
                        }
                        RadioButton {
                            text: "10"
                            exclusiveGroup: ordinateur
                        }
                    }
                    Label{
                        Layout.maximumWidth: list_item.width-30
                        text: "Revenons aux quatre exercices que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant?"
                        font.bold: true
                        font.pointSize: 14
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        wrapMode: Text.WordWrap
                    }
                    Column{
                        leftPadding: 10
                        spacing: 10
                        Label{
                            Layout.maximumWidth: list_item.width-30
                            text: "L’exercice de maths sur les fractions:"
                            font.italic: true
                            font.pointSize: 12
                            fontSizeMode: Text.Fit;
                            minimumPointSize: 12;
                            wrapMode: Text.WordWrap
                        }
                        ExclusiveGroup { id: revenons_fractions }
                        Column{
                            leftPadding: 10
                            RadioButton {
                                text: "je l’ai trouvé très plaisant"
                                exclusiveGroup: revenons_fractions
                            }
                            RadioButton {
                                text: "je l’ai trouvé plaisant"
                                exclusiveGroup: revenons_fractions
                            }
                            RadioButton {
                                text: "je l’ai trouvé ennuyeux"
                                exclusiveGroup: revenons_fractions
                            }
                            RadioButton {
                                text: "je l’ai trouvé très ennuyeux"
                                exclusiveGroup: revenons_fractions
                            }
                        }
                    }
                    /*------*/
                    Column{
                        leftPadding: 10
                        spacing: 10
                        Label{
                            Layout.maximumWidth: list_item.width-30
                            text: "L’exercice de maths au sujet de l’horloge:"
                            font.italic: true
                            font.pointSize: 12
                            fontSizeMode: Text.Fit;
                            minimumPointSize: 12;
                            wrapMode: Text.WordWrap
                        }
                        ExclusiveGroup { id: revenons_horloge }
                        Column{
                            leftPadding: 10
                            RadioButton {
                                text: "je l’ai trouvé très plaisant"
                                exclusiveGroup: revenons_horloge
                            }
                            RadioButton {
                                text: "je l’ai trouvé plaisant"
                                exclusiveGroup: revenons_horloge
                            }
                            RadioButton {
                                text: "je l’ai trouvé ennuyeux"
                                exclusiveGroup: revenons_horloge
                            }
                            RadioButton {
                                text: "je l’ai trouvé très ennuyeux"
                                exclusiveGroup: revenons_horloge
                            }
                        }
                    }
                    /*------*/
                    Column{
                        leftPadding: 10
                        spacing: 10
                        Label{
                            Layout.maximumWidth: list_item.width-30
                            text: "L’exercice de français sur les antonymes:"
                            font.italic: true
                            font.pointSize: 12
                            fontSizeMode: Text.Fit;
                            minimumPointSize: 12;
                            wrapMode: Text.WordWrap
                        }
                        ExclusiveGroup { id: revenons_antonymes }
                        Column{
                            leftPadding: 10
                            RadioButton {
                                text: "je l’ai trouvé très plaisant"
                                exclusiveGroup: revenons_antonymes
                            }
                            RadioButton {
                                text: "je l’ai trouvé plaisant"
                                exclusiveGroup: revenons_antonymes
                            }
                            RadioButton {
                                text: "je l’ai trouvé ennuyeux"
                                exclusiveGroup: revenons_antonymes
                            }
                            RadioButton {
                                text: "je l’ai trouvé très ennuyeux"
                                exclusiveGroup: revenons_antonymes
                            }
                        }
                    }
                    /*------*/
                    Column{
                        leftPadding: 10
                        spacing: 10
                        Label{
                            Layout.maximumWidth: list_item.width-30
                            text: "L’exercice de français sur les débuts de texte à lire:"
                            font.italic: true
                            font.pointSize: 12
                            fontSizeMode: Text.Fit;
                            minimumPointSize: 12;
                            wrapMode: Text.WordWrap
                        }
                        ExclusiveGroup { id: revenons_lire }
                        Column{
                            leftPadding: 10
                            RadioButton {
                                text: "je l’ai trouvé très plaisant"
                                exclusiveGroup: revenons_lire
                            }
                            RadioButton {
                                text: "je l’ai trouvé plaisant"
                                exclusiveGroup: revenons_lire
                            }
                            RadioButton {
                                text: "je l’ai trouvé ennuyeux"
                                exclusiveGroup: revenons_lire
                            }
                            RadioButton {
                                text: "je l’ai trouvé très ennuyeux"
                                exclusiveGroup: revenons_lire
                            }
                        }
                    }
                }
            }
        }

        Rectangle{
            id:questionnaire_done_button
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.margins: 10
            color:"#00e676"
            height: text_temine.height+10
            width: text_temine.width+10
            radius: 10
            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
            }
            Text{
                id:text_temine
                text:"Questionnaire terminé"
                font.family: "Helvetica"
                font.pointSize: 16
                font.bold: true
                fontSizeMode: Text.Fit;
                minimumPointSize: 12;
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onPressed: parent.layer.enabled=false
                onReleased: parent.layer.enabled=true
                onClicked: {
                    if(checkMissingFields()){
                        var tmp="";
                        tmp=tmp.concat("Age;",agegroup.current.text,"\n")
                        tmp=tmp.concat("Sexe;",sexgroup.current.text,"\n")
                        tmp=tmp.concat("Niveau scolaire en français ;",francegroup.current.text)
                        if(francegroup.current.text=="Autre")
                            tmp=tmp.concat(";",franceniveau_autre.text,"\n");
                        else
                            tmp=tmp.concat("\n");

                        tmp=tmp.concat("Niveau scolaire en mathématiques ;",mathematiques.current.text)
                        if(mathematiques.current.text=="Autre")
                            tmp=tmp.concat(";",mathematiquesniveau_autre.text,"\n");
                        else
                            tmp=tmp.concat("\n");

                        tmp=tmp.concat("Niveau scolaire en allemand ;",allemand.current.text)
                        if(allemand.current.text=="Autre")
                            tmp=tmp.concat(";",allemandniveau_autre.text,"\n");
                        else
                            tmp=tmp.concat("\n");

                        tmp=tmp.concat("Niveau scolaire en sciences ;",sciences.current.text)
                        if(sciences.current.text=="Autre")
                            tmp=tmp.concat(";",sciencesniveau_autre.text,"\n");
                        else
                            tmp=tmp.concat("\n");

                        tmp=tmp.concat("Que penses-tu du français?;",penses_france.current.text,"\n")
                        tmp=tmp.concat("Que penses-tu des mathématiques?;",penses_mathematiques.current.text,"\n")
                        tmp=tmp.concat("A quelle fréquence utilises-tu l’ordinateur, le smartphone ou d’autres appareils pour communiquer avec les autres, sur une échelle de 1 à 10?;",
                                       ordinateur.current.text,"\n")
                        tmp=tmp.concat("Revenons aux L’exercice de maths sur les fractions que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant?;",revenons_fractions.current.text,"\n")
                        tmp=tmp.concat("Revenons aux l'exercice de maths au sujet de l’horloge que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant?;",revenons_horloge.current.text,"\n")
                        tmp=tmp.concat("Revenons aux l'exercice de français sur les antonymes que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant?;",revenons_antonymes.current.text,"\n")
                        tmp=tmp.concat("Revenons aux l'exercice de français sur les débuts de texte à lire que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant?;",revenons_lire.current.text,"\n")
                        logger.write_questionnaire(tmp);
                        exit_dialog.visible=true;
                    }
                }
            }

        }

    }


}

