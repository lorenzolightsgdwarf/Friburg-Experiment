import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2

/*Verbs*/
Item{
    id:root

    function pullState(){
        root.enabled=!exBlueStep2State.complete

    }

    function pushState(){
        exBlueStep2State.writeState();
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        Text{
            Layout.fillWidth: true
            text:"Dans chaque liste de mots, clique sur l’intrus pour le biffer."
            wrapMode: Text.WordWrap
            font.family: "Helvetica"
            font.pointSize: 14
            fontSizeMode: Text.Fit;
            minimumPointSize: 12;
        }
        RowLayout{
            Layout.fillWidth: true
            spacing: 10
            Text{
                text:"a. "
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Text{
                id:a1
                text:"étonné"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a1==text ? true: false
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        exBlueStep2State.a1=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)
                    }
                }
            }
            Text{
                id:a2
                text:"surpris"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a1==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        exBlueStep2State.a1=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)
                    }
                }
            }
            Text{
                id:a3
                text:"éberlué"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a1==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a1=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:a4
                text:"stupéfait"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a1==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a1=parent.text;

                        logger.write_general_action("Mouse_Select",parent.text)

                    }
                }
            }
            Text{
                id:a5
                text:"rassuré"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a1==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a1=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:a6
                text:"déconcerté"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a1==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        exBlueStep2State.a1=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
        }
        RowLayout{
            Layout.fillWidth: true
            spacing: 10
            Text{
                text:"b. "
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Text{
                id:b1
                text:"aversion"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a2==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a2=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:b2
                text:"dégoût"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a2==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a2=parent.text;

                        logger.write_general_action("Mouse_Select",parent.text)

                    }
                }
            }
            Text{
                id:b3
                text:"répugnance"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a2==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a2=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:b4
                text:"sympathie"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a2==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a2=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:b5
                text:"répulsion"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a2==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a2=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }

        }
        RowLayout{
            Layout.fillWidth: true
            spacing: 10
            Text{
                text:"c. "
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Text{
                id:c1
                text:"obligeante"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a3==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a3=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:c2
                text:"serviable"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a3==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a3=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:c3
                text:"aimable"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a3==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a3=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:c4
                text:"empressée"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a3==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a3=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:c5
                text:"malveillante"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a3==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a3=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }

        }
        RowLayout{
            Layout.fillWidth: true
            spacing: 10
            Text{
                text:"d. "
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Text{
                id:d1
                text:"frémir"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a4==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        exBlueStep2State.a4=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:d2
                text:"trembler"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a4==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a4=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:d3
                text:"trembloter"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a4==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a4=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:d4
                text:"gémir"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a4==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a4=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:d5
                text:"grelotter"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a4==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a4=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:d6
                text:"frissonner"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a4==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a4=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }

        }

        RowLayout{
            Layout.fillWidth: true
            spacing: 10
            Text{
                text:"e. "
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Text{
                id:e1
                text:"farouche"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a5==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a5=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:e2
                text:"sauvage"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a5==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a5=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:e3
                text:"rude"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a5==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a5=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:e4
                text:"indompté"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a5==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a5=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:e5
                text:"docile"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a5==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a5=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:e6
                text:"ombrageux"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a5==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a5=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }

        }

        RowLayout{
            Layout.fillWidth: true
            spacing: 10
            Text{
                text:"f. "
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Text{
                id:f1
                text:"se lamenter"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a6==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a6=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:f2
                text:"gémir"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a6==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a6=parent.text;

                        logger.write_general_action("Mouse_Select",parent.text)

                    }
                }
            }
            Text{
                id:f3
                text:"geindre"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a6==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a6=parent.text;

                        logger.write_general_action("Mouse_Select",parent.text)

                    }
                }
            }
            Text{
                id:f4
                text:"pleurer"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a6==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a6=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:f5
                text:"se plaindre"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a6==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a6=parent.text;

                        logger.write_general_action("Mouse_Select",parent.text)

                    }
                }
            }
            Text{
                id:f6
                text:"se rassurer"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a6==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a6=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }

        }
        RowLayout{
            Layout.fillWidth: true
            spacing: 10
            Text{
                text:"g. "
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Text{
                id:g1
                text:"paniqué"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a7=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:g2
                text:"affolé"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a7=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:g3
                text:"freiné"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a7=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:g4
                text:"effrayé"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a7=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:g5
                text:"apeuré"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a7=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:g6
                text:"épouvanté"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a7=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:g7
                text:"tourmenté"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a7=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }

        }

        RowLayout{
            Layout.fillWidth: true
            spacing: 10
            Text{
                text:"h. "
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Text{
                id:h1
                text:"disgrâce"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a8==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a8=parent.text;

                        logger.write_general_action("Mouse_Select",parent.text)

                    }
                }
            }
            Text{
                id:h2
                text:"malheur"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a8==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a8=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:h3
                text:"mésaventure"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a8==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a8=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:h4
                text:"chance"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a8==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a8=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:h5
                text:"désastre"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a8==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a8=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:h6
                text:"infortune"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a8==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a8=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }

        }

        RowLayout{
            Layout.fillWidth: true
            spacing: 10
            Text{
                text:"i. "
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Text{
                id:i1
                text:"divertir"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a9==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a9=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:i2
                text:"égayer"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a9==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a9=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:i3
                text:"distraire"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a9==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a9=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:i4
                text:"accabler"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a9==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a9=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:i5
                text:"réjouir"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a9==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a9=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:i6
                text:"amuser"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a9==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a9=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:i7
                text:"plaisanter"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a9==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a9=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }

        }
        RowLayout{
            Layout.fillWidth: true
            spacing: 10
            Text{
                text:"j. "
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Text{
                id:j1
                text:"civilité"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a10==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a10=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:j2
                text:"courtoisie"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a10==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a10=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:j3
                text:"politesse"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a10==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a10=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:j4
                text:"amabilité"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a10==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a10=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:j5
                text:"délicatesse"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a10==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a10=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


                    }
                }
            }
            Text{
                id:j6
                text:"stratagème"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exBlueStep2State.a10==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exBlueStep2State.a10=parent.text;
                        logger.write_general_action("Mouse_Select",parent.text)


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
                font.bold: true
                fontSizeMode: Text.Fit;
                minimumPointSize: 12;
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    exBlueStep2State.complete=true;
                    pushState();
                    root.enabled=false;
                }
            }

        }

    }


}


