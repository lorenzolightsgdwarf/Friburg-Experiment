import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2

/*Verbs*/
Item{
    id:root

    function pullState(){
        root.enabled=!exTresFacileStateFrench.complete

        if(a1.text==exTresFacileStateFrench.a1)
            a1.font.strikeout=true
        else if(a2.text==exTresFacileStateFrench.a1)
            a2.font.strikeout=true
        else if(a3.text==exTresFacileStateFrench.a1)
            a3.font.strikeout=true
        else if(a4.text==exTresFacileStateFrench.a1)
            a4.font.strikeout=true
        else if(a5.text==exTresFacileStateFrench.a1)
            a5.font.strikeout=true

        if(b1.text==exTresFacileStateFrench.a2)
            b1.font.strikeout=true
        else if(b2.text==exTresFacileStateFrench.a2)
            b2.font.strikeout=true
        else if(b3.text==exTresFacileStateFrench.a2)
            b3.font.strikeout=true
        else if(b4.text==exTresFacileStateFrench.a2)
            b4.font.strikeout=true
        else if(b5.text==exTresFacileStateFrench.a2)
            b5.font.strikeout=true

        if(c1.text==exTresFacileStateFrench.a3)
            c1.font.strikeout=true
        else if(c2.text==exTresFacileStateFrench.a3)
            c2.font.strikeout=true
        else if(c3.text==exTresFacileStateFrench.a3)
            c3.font.strikeout=true
        else if(c4.text==exTresFacileStateFrench.a3)
            c4.font.strikeout=true
        else if(c5.text==exTresFacileStateFrench.a3)
            c5.font.strikeout=true

        if(d1.text==exTresFacileStateFrench.a4)
            d1.font.strikeout=true
        else if(d2.text==exTresFacileStateFrench.a4)
            d2.font.strikeout=true
        else if(d3.text==exTresFacileStateFrench.a4)
            d3.font.strikeout=true
        else if(d4.text==exTresFacileStateFrench.a4)
            d4.font.strikeout=true
        else if(d5.text==exTresFacileStateFrench.a4)
            d5.font.strikeout=true

        if(e1.text==exTresFacileStateFrench.a5)
            e1.font.strikeout=true
        else if(e2.text==exTresFacileStateFrench.a5)
            e2.font.strikeout=true
        else if(e3.text==exTresFacileStateFrench.a5)
            e3.font.strikeout=true
        else if(e4.text==exTresFacileStateFrench.a5)
            e4.font.strikeout=true
        else if(e5.text==exTresFacileStateFrench.a5)
            e5.font.strikeout=true
        else if(e6.text==exTresFacileStateFrench.a5)
            e6.font.strikeout=true

        if(f1.text==exTresFacileStateFrench.a6)
            f1.font.strikeout=true
        else if(f2.text==exTresFacileStateFrench.a6)
            f2.font.strikeout=true
        else if(f3.text==exTresFacileStateFrench.a6)
            f3.font.strikeout=true
        else if(f4.text==exTresFacileStateFrench.a6)
            f4.font.strikeout=true
        else if(f5.text==exTresFacileStateFrench.a6)
            f5.font.strikeout=true
        else if(f6.text==exTresFacileStateFrench.a6)
            f6.font.strikeout=true

        if(g1.text==exTresFacileStateFrench.a7)
            g1.font.strikeout=true
        else if(g2.text==exTresFacileStateFrench.a7)
            g2.font.strikeout=true
        else if(g3.text==exTresFacileStateFrench.a7)
            g3.font.strikeout=true
        else if(g4.text==exTresFacileStateFrench.a7)
            g4.font.strikeout=true
        else if(g5.text==exTresFacileStateFrench.a7)
            g5.font.strikeout=true
        else if(g6.text==exTresFacileStateFrench.a7)
            g6.font.strikeout=true

        if(h1.text==exTresFacileStateFrench.a8)
            h1.font.strikeout=true
        else if(h2.text==exTresFacileStateFrench.a8)
            h2.font.strikeout=true
        else if(h3.text==exTresFacileStateFrench.a8)
            h3.font.strikeout=true
        else if(h4.text==exTresFacileStateFrench.a8)
            h4.font.strikeout=true
        else if(h5.text==exTresFacileStateFrench.a8)
            h5.font.strikeout=true

        if(i1.text==exTresFacileStateFrench.a9)
            i1.font.strikeout=true
        else if(i2.text==exTresFacileStateFrench.a9)
            i2.font.strikeout=true
        else if(i3.text==exTresFacileStateFrench.a9)
            i3.font.strikeout=true
        else if(i4.text==exTresFacileStateFrench.a9)
            i4.font.strikeout=true
        else if(i5.text==exTresFacileStateFrench.a9)
            i5.font.strikeout=true
        else if(i6.text==exTresFacileStateFrench.a9)
            i6.font.strikeout=true

        if(j1.text==exTresFacileStateFrench.a10)
            j1.font.strikeout=true
        else if(j2.text==exTresFacileStateFrench.a10)
            j2.font.strikeout=true
        else if(j3.text==exTresFacileStateFrench.a10)
            j3.font.strikeout=true
        else if(j4.text==exTresFacileStateFrench.a10)
            j4.font.strikeout=true
        else if(j5.text==exTresFacileStateFrench.a10)
            j5.font.strikeout=true

    }

    function pushState(){
        exTresFacileStateFrench.writeState();
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        Text{
            Layout.fillWidth: true
            text:"Dans chaque liste de mots, coche l’intrus."
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
                text:"S’immobiliser"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a1==text ? true: false
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        exTresFacileStateFrench.a1=parent.text;


                    }
                }
            }
            Text{
                id:a2
                text:"s’arrêter"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a1==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        exTresFacileStateFrench.a1=parent.text;


                    }
                }
            }
            Text{
                id:a3
                text:"s’impatienter"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a1==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a1=parent.text;


                    }
                }
            }
            Text{
                id:a4
                text:"se tenir sans bouger"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a1==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a1=parent.text;


                    }
                }
            }
            Text{
                id:a5
                text:"se fixer"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a1==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a1=parent.text;


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
                text:"À l’aise"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a2==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a2=parent.text;


                    }
                }
            }
            Text{
                id:b2
                text:"rassuré"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a2==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a2=parent.text;


                    }
                }
            }
            Text{
                id:b3
                text:"embarrassé"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a2==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a2=parent.text;


                    }
                }
            }
            Text{
                id:b4
                text:"tranquille"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a2==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a2=parent.text;


                    }
                }
            }
            Text{
                id:b5
                text:"calme"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a2==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a2=parent.text;


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
                text:"Grimper"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a3==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a3=parent.text;


                    }
                }
            }
            Text{
                id:c2
                text:"aggraver"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a3==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a3=parent.text;


                    }
                }
            }
            Text{
                id:c3
                text:"escalader"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a3==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a3=parent.text;


                    }
                }
            }
            Text{
                id:c4
                text:"gravir"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a3==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a3=parent.text;


                    }
                }
            }
            Text{
                id:c5
                text:"monter"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a3==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a3=parent.text;


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
                text:"Fugitivement"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a4==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        exTresFacileStateFrench.a4=parent.text;


                    }
                }
            }
            Text{
                id:d2
                text:"rapidement"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a4==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a4=parent.text;


                    }
                }
            }
            Text{
                id:d3
                text:"furtivement"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a4==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a4=parent.text;


                    }
                }
            }
            Text{
                id:d4
                text:"abondamment"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a4==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a4=parent.text;


                    }
                }
            }
            Text{
                id:d5
                text:"brièvement"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a4==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a4=parent.text;


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
                text:"Anodin"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a5==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a5=parent.text;


                    }
                }
            }
            Text{
                id:e2
                text:"inquiétant"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a5==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a5=parent.text;


                    }
                }
            }
            Text{
                id:e3
                text:"inoffensif"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a5==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a5=parent.text;


                    }
                }
            }
            Text{
                id:e4
                text:"pacifique"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a5==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a5=parent.text;


                    }
                }
            }
            Text{
                id:e5
                text:"doux"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a5==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a5=parent.text;


                    }
                }
            }
            Text{
                id:e6
                text:"calme"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a5==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a5=parent.text;


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
                text:"Chaleureuse"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a6==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a6=parent.text;


                    }
                }
            }
            Text{
                id:f2
                text:"cordiale"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a6==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a6=parent.text;


                    }
                }
            }
            Text{
                id:f3
                text:"avenante"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a6==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a6=parent.text;


                    }
                }
            }
            Text{
                id:f4
                text:"sympathique"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a6==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a6=parent.text;


                    }
                }
            }
            Text{
                id:f5
                text:"ironique"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a6==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a6=parent.text;


                    }
                }
            }
            Text{
                id:f6
                text:"affectueuse"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a6==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a6=parent.text;


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
                text:"Effleurer"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a7=parent.text;


                    }
                }
            }
            Text{
                id:g2
                text:"gratter"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a7=parent.text;


                    }
                }
            }
            Text{
                id:g3
                text:"érafler"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a7=parent.text;


                    }
                }
            }
            Text{
                id:g4
                text:"toucher"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a7=parent.text;


                    }
                }
            }
            Text{
                id:g5
                text:"frôler"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a7=parent.text;


                    }
                }
            }
            Text{
                id:g6
                text:"caresser"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a7=parent.text;


                    }
                }
            }
            Text{
                id:g7
                text:"attacher"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a7==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a7=parent.text;


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
                text:"Lacérer"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a8==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a8=parent.text;


                    }
                }
            }
            Text{
                id:h2
                text:"déchirer"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a8==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a8=parent.text;


                    }
                }
            }
            Text{
                id:h3
                text:"décimer"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a8==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a8=parent.text;


                    }
                }
            }
            Text{
                id:h4
                text:"couper"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a8==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a8=parent.text;


                    }
                }
            }
            Text{
                id:h5
                text:"mettre en lambeaux"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a8==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a8=parent.text;


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
                text:"Boucler"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a9==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a9=parent.text;


                    }
                }
            }
            Text{
                id:i2
                text:"fermer"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a9==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a9=parent.text;


                    }
                }
            }
            Text{
                id:i3
                text:"enclore"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a9==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a9=parent.text;


                    }
                }
            }
            Text{
                id:i4
                text:"boucher"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a9==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a9=parent.text;


                    }
                }
            }
            Text{
                id:i5
                text:"s’enfuir"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a9==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a9=parent.text;


                    }
                }
            }
            Text{
                id:i6
                text:"emprisonner"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a9==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a9=parent.text;


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
                text:"Plaisant"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a10==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a10=parent.text;


                    }
                }
            }
            Text{
                id:j2
                text:"divertissant"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a10==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a10=parent.text;


                    }
                }
            }
            Text{
                id:j3
                text:"morose"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a10==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a10=parent.text;


                    }
                }
            }
            Text{
                id:j4
                text:"drôle"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a10==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a10=parent.text;


                    }
                }
            }
            Text{
                id:j5
                text:"réjouissant"
                font.family: "Helvetica"
                font.pointSize: 12
                style: Text.Raised; styleColor: "#AAAAAA"
                font.strikeout:exTresFacileStateFrench.a10==text
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        exTresFacileStateFrench.a10=parent.text;


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
                    exTresFacileStateFrench.complete=true;
                    pushState();
                    root.enabled=false;
                }
            }

        }

    }


}


