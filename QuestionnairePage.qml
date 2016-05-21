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
            dialog.text="« Remplis le champ: <b>Age</b>"
            dialog.visible=true
             return false;

        }
        if(!sexgroup.current){
            dialog.text="« Remplis le champ: <b>Sexe</b>"
            dialog.visible=true
             return false;

        }
        if(!francegroup.current || (francegroup.current.text=="Autre" && franceniveau_autre.text.length==0)){
            dialog.text="« Remplis le champ: <b>Niveau en français</b>"
            dialog.visible=true
             return false;

        }
        if(!mathematiques.current || (mathematiques.current.text=="Autre" && mathematiquesniveau_autre.text.length==0)){
            dialog.text="« Remplis le champ: <b>Niveau en mathématiques</b>"
            dialog.visible=true
             return false;

        }
        if(!allemand.current || (allemand.current.text=="Autre" && allemandniveau_autre.text.length==0)){
            dialog.text="« Remplis le champ: <b>Niveau en allemand</b>"
            dialog.visible=true
             return false;

        }
        if(!sciences.current || (sciences.current.text=="Autre" && sciencesniveau_autre.text.length==0)){
            dialog.text="« Remplis le champ: <b>Niveau en sciences</b>"
            dialog.visible=true
             return false;

        }
        if(!penses_france.current){
            dialog.text="« Remplis le champ: <b>Que penses-tu du français?</b>"
            dialog.visible=true
             return false;

        }
        if(!penses_mathematiques.current){
            dialog.text="« Remplis le champ: <b>Que penses-tu du mathématiques?</b>"
            dialog.visible=true
             return false;

        }
        if(!ordinateur.current){
            dialog.text="« Remplis le champ: <b>A quelle fréquence utilises-tu l’ordinateur, le smartphone ou d’autres appareils pour communiquer avec les autres, sur une échelle de 1 à 10?</b>"
            dialog.visible=true
             return false;

        }

        if(window.condition==2 && !plaisir_historie.current){
            dialog.text="« Remplis le champ: <b>Revenons aux quatre exercices que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant en termes de plaisir et d’ennui</b>"
            dialog.visible=true
             return false;

        }
        if(window.condition==2 &&!plaisir_verbes.current){
            dialog.text="« Remplis le champ: <b>Revenons aux quatre exercices que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant en termes de plaisir et d’ennui</b>"
            dialog.visible=true
             return false;

        }
        if(window.condition==2 &&!plaisir_romans.current){
            dialog.text="« Remplis le champ: <b>Revenons aux quatre exercices que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant en termes de plaisir et d’ennui</b>"
            dialog.visible=true
             return false;

        }
        if(window.condition==2 &&!plaisir_intrus.current){
            dialog.text="« Remplis le champ: <b>Revenons aux quatre exercices que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant en termes de plaisir et d’ennui</b>"
            dialog.visible=true
             return false;
        }

        if(window.condition==2 && !difficulte_historie.current){
            dialog.text="« Remplis le champ: <b>Toujours à propos de ces 4 exercices, comment les as-tu trouvés en termes de difficulté</b>"
            dialog.visible=true
             return false;

        }
        if(window.condition==2 &&!difficulte_verbes.current){
            dialog.text="« Remplis le champ: <b>Toujours à propos de ces 4 exercices, comment les as-tu trouvés en termes de difficulté</b>"
            dialog.visible=true
             return false;

        }
        if(window.condition==2 &&!difficulte_romans.current){
            dialog.text="« Remplis le champ: <b>Toujours à propos de ces 4 exercices, comment les as-tu trouvés en termes de difficulté</b>"
            dialog.visible=true
             return false;

        }
        if(window.condition==2 &&!difficulte_intrus.current){
            dialog.text="« Remplis le champ: <b>Toujours à propos de ces 4 exercices, comment les as-tu trouvés en termes de difficulté</b>"
            dialog.visible=true
             return false;
        }


        /*Math*/
        if(window.condition==1 && !plaisir_matrice.current){
            dialog.text="« Remplis le champ: <b>Revenons aux quatre exercices que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant en termes de plaisir et d’ennui</b>"
            dialog.visible=true
             return false;

        }
        if(window.condition==1 &&!plaisir_horloge.current){
            dialog.text="« Remplis le champ: <b>Revenons aux quatre exercices que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant en termes de plaisir et d’ennui</b>"
            dialog.visible=true
             return false;

        }
        if(window.condition==1 &&!plaisir_courses.current){
            dialog.text="« Remplis le champ: <b>Revenons aux quatre exercices que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant en termes de plaisir et d’ennui</b>"
            dialog.visible=true
             return false;

        }
        if(window.condition==1 &&!plaisir_fraction.current){
            dialog.text="« Remplis le champ: <b>Revenons aux quatre exercices que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant en termes de plaisir et d’ennui</b>"
            dialog.visible=true
             return false;
        }

        if(window.condition==1 && !difficulte_matrice.current){
            dialog.text="« Remplis le champ: <b>Toujours à propos de ces 4 exercices, comment les as-tu trouvés en termes de difficulté</b>"
            dialog.visible=true
             return false;

        }
        if(window.condition==1 &&!difficulte_horloge.current){
            dialog.text="« Remplis le champ: <b>Toujours à propos de ces 4 exercices, comment les as-tu trouvés en termes de difficulté</b>"
            dialog.visible=true
             return false;

        }
        if(window.condition==1 &&!difficulte_courses.current){
            dialog.text="« Remplis le champ: <b>Toujours à propos de ces 4 exercices, comment les as-tu trouvés en termes de difficulté</b>"
            dialog.visible=true
             return false;

        }
        if(window.condition==1 &&!difficulte_fraction.current){
            dialog.text="« Remplis le champ: <b>Toujours à propos de ces 4 exercices, comment les as-tu trouvés en termes de difficulté</b>"
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
        text:"« Remplis le champ: "
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
        text:"Merci pour ta participation!"
        onAccepted:{
            exitFlag=true
            Qt.quit()
        }
    }

    Rectangle{
        width:  Math.min(parent.height,parent.width)
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
            anchors.bottomMargin: 10
            ScrollView{
                anchors.fill: parent
                horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
                ColumnLayout{
                    width: list_item.width
                    anchors.margins: 20
                    spacing: 10
                    /*French questions*/
                    Label{
                        visible: window.condition==2
                        Layout.maximumWidth: list_item.width-30
                        text: "Revenons aux quatre exercices que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant en termes de <b>plaisir</b> et <b>d’ennui</b> ?"
                        font.pointSize: 14
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        wrapMode: Text.WordWrap
                    }
                    GridLayout {
                        visible: window.condition==2
                        Layout.maximumWidth: list_item.width-30
                        rows: 6
                        columns: 5
                        ExclusiveGroup { id: plaisir_historie }
                        ExclusiveGroup { id: plaisir_verbes }
                        ExclusiveGroup { id: plaisir_romans }
                        ExclusiveGroup { id: plaisir_intrus }
                        Rectangle{
                            width: 10
                            height: 10
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Ecris la fin de l’histoire</i>"
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Conjugue les verbes</i>"
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Lis les débuts de romans</i>"
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Trouve l’intrus</i>"
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"J’ai trouvé cet exercice…"
                        }
                        Rectangle{
                            width: 10
                            height: 10}

                        Rectangle{
                            width: 10
                            height: 10
                        }
                        Rectangle{
                            width: 10
                            height: 10
                        }
                        Rectangle{
                            width: 10
                            height: 10
                        }

                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…très plaisant"
                        }
                        RadioButton{
                            property string response: "très plaisant"
                            exclusiveGroup: plaisir_historie
                        }
                        RadioButton{
                            property string response: "très plaisant"

                            exclusiveGroup: plaisir_verbes
                        }
                        RadioButton{
                            property string response: "très plaisant"

                            exclusiveGroup: plaisir_romans
                        }
                        RadioButton{
                            property string response: "très plaisant"

                            exclusiveGroup: plaisir_intrus
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…plaisant"
                        }
                        RadioButton{
                            property string response: "plaisant"

                            exclusiveGroup: plaisir_historie
                        }
                        RadioButton{
                            property string response: "plaisant"

                            exclusiveGroup: plaisir_verbes
                        }
                        RadioButton{
                            property string response: "plaisant"

                            exclusiveGroup: plaisir_romans
                        }
                        RadioButton{
                            property string response: "plaisant"

                            exclusiveGroup: plaisir_intrus
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…ennuyeux"
                        }
                        RadioButton{
                            property string response:"ennuyeux"

                            exclusiveGroup: plaisir_historie
                        }
                        RadioButton{
                            property string response:"ennuyeux"

                            exclusiveGroup: plaisir_verbes
                        }
                        RadioButton{
                            property string response:"ennuyeux"

                            exclusiveGroup: plaisir_romans
                        }
                        RadioButton{
                            property string response:"ennuyeux"

                            exclusiveGroup: plaisir_intrus
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…très ennuyeux"
                        }
                        RadioButton{
                            property string response:"très ennuyeux"

                            exclusiveGroup: plaisir_historie
                        }
                        RadioButton{
                            property string response:"très ennuyeux"

                            exclusiveGroup: plaisir_verbes
                        }
                        RadioButton{
                            property string response:"très ennuyeux"

                            exclusiveGroup: plaisir_romans
                        }
                        RadioButton{
                            property string response:"très ennuyeux"

                            exclusiveGroup: plaisir_intrus
                        }

                    }
                    Rectangle{
                        visible: window.condition==2
                        Layout.preferredHeight: 5
                        Layout.preferredWidth: list_item.width-30
                        color: "black"
                        radius: 2

                    }
                    Label{
                        visible: window.condition==2
                        Layout.maximumWidth: list_item.width-30
                        text: "Toujours à propos de ces 4 exercices, comment les as-tu trouvés en termes de <b>difficulté</b> ?"
                        font.pointSize: 14
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        wrapMode: Text.WordWrap
                    }
                    GridLayout {
                        visible: window.condition==2
                        Layout.maximumWidth: list_item.width-30
                        rows: 6
                        columns: 5
                        ExclusiveGroup { id: difficulte_historie }
                        ExclusiveGroup { id: difficulte_verbes }
                        ExclusiveGroup { id: difficulte_romans }
                        ExclusiveGroup { id: difficulte_intrus }
                        Rectangle{
                            width: 10
                            height: 10
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Ecris la fin de l’histoire</i>"
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Conjugue les verbes</i>"
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Lis les débuts de romans</i>"
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Trouve l’intrus</i>"
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"J’ai trouvé cet exercice…"
                        }
                        Rectangle{
                            width: 10
                            height: 10}

                        Rectangle{
                            width: 10
                            height: 10
                        }
                        Rectangle{
                            width: 10
                            height: 10
                        }
                        Rectangle{
                            width: 10
                            height: 10
                        }

                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…très facile"
                        }
                        RadioButton{
                            property string response:"très facile"

                            exclusiveGroup: difficulte_historie
                        }
                        RadioButton{
                            property string response:"très facile"

                            exclusiveGroup: difficulte_verbes
                        }
                        RadioButton{
                            property string response:"très facile"

                            exclusiveGroup: difficulte_romans
                        }
                        RadioButton{
                            property string response:"très facile"

                            exclusiveGroup: difficulte_intrus
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…facile"
                        }
                        RadioButton{
                            property string response:"facile"

                            exclusiveGroup: difficulte_historie
                        }
                        RadioButton{
                            property string response:"facile"

                            exclusiveGroup: difficulte_verbes
                        }
                        RadioButton{
                            property string response:"facile"

                            exclusiveGroup: difficulte_romans
                        }
                        RadioButton{
                            property string response:"facile"

                            exclusiveGroup: difficulte_intrus
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…difficile"
                        }
                        RadioButton{
                            property string response:"difficile"

                            exclusiveGroup: difficulte_historie
                        }
                        RadioButton{
                            property string response:"difficile"

                            exclusiveGroup: difficulte_verbes
                        }
                        RadioButton{
                            property string response:"difficile"

                            exclusiveGroup: difficulte_romans
                        }
                        RadioButton{
                            property string response:"difficile"

                            exclusiveGroup: difficulte_intrus
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…très difficile"
                        }
                        RadioButton{
                            property string response:"très difficile"

                            exclusiveGroup: difficulte_historie
                        }
                        RadioButton{
                            property string response:"très difficile"

                            exclusiveGroup: difficulte_verbes
                        }
                        RadioButton{
                            property string response:"très difficile"

                            exclusiveGroup: difficulte_romans
                        }
                        RadioButton{
                            property string response:"très difficile"

                            exclusiveGroup: difficulte_intrus
                        }

                    }
                    Rectangle{
                        visible: window.condition==2
                        Layout.preferredHeight: 5
                        Layout.preferredWidth: list_item.width-30
                        color: "black"
                        radius: 2

                    }
                    /*Maths questions*/
                    Label{
                        visible: window.condition==1
                        Layout.maximumWidth: list_item.width-30
                        text: "Revenons aux quatre exercices que tu viens d’effectuer. Qu’as-tu ressenti en les réalisant en termes de <b>plaisir</b> et <b>d’ennui</b> ?"
                        font.pointSize: 14
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        wrapMode: Text.WordWrap
                    }
                    GridLayout {
                        visible: window.condition==1
                        Layout.maximumWidth: list_item.width-30
                        rows: 6
                        columns: 5
                        ExclusiveGroup { id: plaisir_matrice }
                        ExclusiveGroup { id: plaisir_horloge }
                        ExclusiveGroup { id: plaisir_courses }
                        ExclusiveGroup { id: plaisir_fraction }
                        Rectangle{
                            width: 10
                            height: 10
                        }
                        Label{
                            Layout.fillWidth: true
                            wrapMode: Text.WordWrap
                            text:"Exercice<br><i>Place les nombres dans la matrice </i>"
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Résous le problème avec l’horloge</i>"
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Calcule le prix à payer pour les courses</i>"
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Indique la fraction coloriée</i>"
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"J’ai trouvé cet exercice…"
                        }
                        Rectangle{
                            width: 10
                            height: 10}

                        Rectangle{
                            width: 10
                            height: 10
                        }
                        Rectangle{
                            width: 10
                            height: 10
                        }
                        Rectangle{
                            width: 10
                            height: 10
                        }

                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…très plaisant"
                        }
                        RadioButton{
                            property string response:"très plaisant"

                            exclusiveGroup: plaisir_matrice
                        }
                        RadioButton{
                            property string response:"très plaisant"

                            exclusiveGroup: plaisir_horloge
                        }
                        RadioButton{
                            property string response:"très plaisant"

                            exclusiveGroup: plaisir_courses
                        }
                        RadioButton{
                            property string response:"très plaisant"

                            exclusiveGroup: plaisir_fraction
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…plaisant"
                        }
                        RadioButton{
                            property string response:"plaisant"

                            exclusiveGroup: plaisir_matrice
                        }
                        RadioButton{
                            property string response:"plaisant"

                            exclusiveGroup: plaisir_horloge
                        }
                        RadioButton{
                            property string response:"plaisant"

                            exclusiveGroup: plaisir_courses
                        }
                        RadioButton{
                            property string response:"plaisant"

                            exclusiveGroup: plaisir_fraction
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…ennuyeux"
                        }
                        RadioButton{
                            property string response:"ennuyeux"

                            exclusiveGroup: plaisir_matrice
                        }
                        RadioButton{
                            property string response:"ennuyeux"

                            exclusiveGroup: plaisir_horloge
                        }
                        RadioButton{
                            property string response:"ennuyeux"

                            exclusiveGroup: plaisir_courses
                        }
                        RadioButton{
                            property string response:"ennuyeux"

                            exclusiveGroup: plaisir_fraction
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…très ennuyeux"
                        }
                        RadioButton{
                            property string response:"très ennuyeux"

                            exclusiveGroup: plaisir_matrice
                        }
                        RadioButton{
                            property string response:"très ennuyeux"

                            exclusiveGroup: plaisir_horloge
                        }
                        RadioButton{
                            property string response:"très ennuyeux"

                            exclusiveGroup: plaisir_courses
                        }
                        RadioButton{
                            property string response:"très ennuyeux"

                            exclusiveGroup: plaisir_fraction
                        }

                    }
                    Rectangle{
                        visible: window.condition==1
                        Layout.preferredHeight: 5
                        Layout.preferredWidth: list_item.width-30
                        color: "black"
                        radius: 2

                    }
                    Label{
                        visible: window.condition==1
                        Layout.maximumWidth: list_item.width-30
                        text: "Toujours à propos de ces 4 exercices, comment les as-tu trouvés en termes de <b>difficulté</b> ?"
                        font.pointSize: 14
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        wrapMode: Text.WordWrap
                    }
                    GridLayout {
                        visible: window.condition==1
                        Layout.maximumWidth: list_item.width-30
                        rows: 6
                        columns: 5
                        ExclusiveGroup { id: difficulte_matrice }
                        ExclusiveGroup { id: difficulte_horloge }
                        ExclusiveGroup { id: difficulte_courses }
                        ExclusiveGroup { id: difficulte_fraction }
                        Rectangle{
                            width: 10
                            height: 10
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Place les nombres dans la matrice </i>"
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Résous le problème avec l’horloge</i>"
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Calcule le prix à payer pour les courses</i>"
                        }
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"Exercice<br><i>Indique la fraction coloriée</i>"
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"J’ai trouvé cet exercice…"
                        }
                        Rectangle{
                            width: 10
                            height: 10}

                        Rectangle{
                            width: 10
                            height: 10
                        }
                        Rectangle{
                            width: 10
                            height: 10
                        }
                        Rectangle{
                            width: 10
                            height: 10
                        }

                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…très facile"
                        }
                        RadioButton{
                            property string response:"très facile"

                            exclusiveGroup: difficulte_matrice
                        }
                        RadioButton{
                            property string response:"très facile"

                            exclusiveGroup: difficulte_horloge
                        }
                        RadioButton{
                            property string response:"très facile"

                            exclusiveGroup: difficulte_courses
                        }
                        RadioButton{
                            property string response:"très facile"

                            exclusiveGroup: difficulte_fraction
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…facile"
                        }
                        RadioButton{
                            property string response:"facile"

                            exclusiveGroup: difficulte_matrice
                        }
                        RadioButton{
                            property string response:"facile"

                            exclusiveGroup: difficulte_horloge
                        }
                        RadioButton{
                            property string response:"facile"

                            exclusiveGroup: difficulte_courses
                        }
                        RadioButton{
                            property string response:"facile"

                            exclusiveGroup: difficulte_fraction
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…difficile"
                        }
                        RadioButton{
                            property string response:"difficile"

                            exclusiveGroup: difficulte_matrice
                        }
                        RadioButton{
                            property string response:"difficile"

                            exclusiveGroup: difficulte_horloge
                        }
                        RadioButton{
                            property string response:"difficile"

                            exclusiveGroup: difficulte_courses
                        }
                        RadioButton{
                            property string response:"difficile"

                            exclusiveGroup: difficulte_fraction
                        }
                        /*---------*/
                        Label{
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            text:"…très difficile"
                        }
                        RadioButton{
                            property string response:"très difficile"

                            exclusiveGroup: difficulte_matrice
                        }
                        RadioButton{
                            property string response:"très difficile"

                            exclusiveGroup: difficulte_horloge
                        }
                        RadioButton{
                            property string response:"très difficile"

                            exclusiveGroup: difficulte_courses
                        }
                        RadioButton{
                            property string response:"très difficile"

                            exclusiveGroup: difficulte_fraction
                        }

                    }

                    Rectangle{
                        visible: window.condition==1
                        Layout.preferredHeight: 5
                        Layout.preferredWidth: list_item.width-30
                        color: "black"
                        radius: 2

                    }
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
                    Rectangle{
                        Layout.preferredHeight: 5
                        Layout.preferredWidth: list_item.width-30
                        color: "black"
                        radius: 2

                    }
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
                    Rectangle{
                        Layout.preferredHeight: 5
                        Layout.preferredWidth: list_item.width-30
                        color: "black"
                        radius: 2

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
                    Rectangle{
                        Layout.preferredHeight: 5
                        Layout.preferredWidth: list_item.width-30
                        color: "black"
                        radius: 2

                    }
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
                    Rectangle{
                        Layout.preferredHeight: 5
                        Layout.preferredWidth: list_item.width-30
                        color: "black"
                        radius: 2

                    }
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
                    Rectangle{
                        Layout.preferredHeight: 5
                        Layout.preferredWidth: list_item.width-30
                        color: "black"
                        radius: 2

                    }
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
                        Layout.alignment:Qt.AlignVCenter | Qt.AlignHCenter
                        spacing: (list_item.width-10*radioButton_reference.width-40)/10
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
                            id:radioButton_reference
                            text: "10"
                            exclusiveGroup: ordinateur
                        }
                    }
                    Row{
                        Layout.alignment:Qt.AlignVCenter | Qt.AlignHCenter
                        //spacing: (list_item.width-10*radioButton_reference.width-40)/10
                        spacing:5
                        leftPadding: 10
                        Text{
                            id:reference_text
                            text: "Minimal"
                        }
                        Rectangle {
                            anchors.verticalCenter: reference_text.verticalCenter
                            width: radioButton_reference.width*8+7*(list_item.width-10*radioButton_reference.width-40)/10
                            height: 3
                            color: "black"
                        }
                        Text {
                            text: "Maximal"
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
                        if(window.condition==1){
                            tmp=tmp.concat("Maths_plaisir_ex_matrice;",plaisir_matrice.current.response,"\n")
                            tmp=tmp.concat("Maths_plaisir_ex_horloge;",plaisir_horloge.current.response,"\n")
                            tmp=tmp.concat("Maths_plaisir_ex_pris_courses;",plaisir_courses.current.response,"\n")
                            tmp=tmp.concat("Maths_plaisir_ex_fraction;",plaisir_fraction.current.response,"\n")

                            tmp=tmp.concat("Maths_difficulte_ex_matrice;",difficulte_matrice.current.response,"\n")
                            tmp=tmp.concat("Maths_difficulte_ex_horloge;",difficulte_horloge.current.response,"\n")
                            tmp=tmp.concat("Maths_difficulte_ex_pris_courses;",difficulte_courses.current.response,"\n")
                            tmp=tmp.concat("Maths_difficulte_ex_fraction;",difficulte_fraction.current.response,"\n")

                        }
                        else if(window.condtion==2){
                            tmp=tmp.concat("French_plaisir_ex_historie;",plaisir_historie.current.response,"\n")
                            tmp=tmp.concat("French_plaisir_ex_verbes;",plaisir_verbes.current.response,"\n")
                            tmp=tmp.concat("French_plaisir_ex_romans;",plaisir_romans.current.response,"\n")
                            tmp=tmp.concat("French_plaisir_ex_intrus;",plaisir_intrus.current.response,"\n")

                            tmp=tmp.concat("French_difficulte_ex_historie;",difficulte_historie.current.response,"\n")
                            tmp=tmp.concat("French_difficulte_ex_verbes;",difficulte_verbes.current.response,"\n")
                            tmp=tmp.concat("French_difficulte_ex_romans;",difficulte_romans.current.response,"\n")
                            tmp=tmp.concat("French_difficulte_ex_intrus;",difficulte_intrus.current.response,"\n")


                        }
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
                        logger.write_questionnaire(tmp);
                        exit_dialog.visible=true;
                    }
                }
            }

        }

    }


}

