import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
Rectangle{
    visible:false
    id:final_questions
    anchors.fill: parent
    color:"#e3f2fd"
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
                        wrapMode: Text.WordWrap

                    }
                    Label{
                        Layout.maximumWidth: list_item.width-30
                        text:"Le chiffre 1 correspond à une fréquence de connexion minimale et le chiffre 10 correspond à une fréquence maximale."
                        font.italic: true
                        font.pointSize: 12
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
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 10
            width: 75
            color: "#00e676"
            height: width
            radius: width/2
            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
            }
            Image{
                anchors.fill: parent
                anchors.centerIn: parent
                source:"qrc:/done.png"
            }
            MouseArea{
                anchors.fill: parent;
                onPressed: parent.layer.enabled=false
                onReleased: parent.layer.enabled=true
                onClicked: {
                    messageBox.title="Finished"
                    messageBox.text="Thanks for your participation"
                    messageBox.visible=true
                }
            }
        }
    }


}

