import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2

/*Verbs*/
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
        root.enabled=!exFacileStateFrench.complete
        a1.text=exFacileStateFrench.a1;
        a2.text=exFacileStateFrench.a2;
        a3.text=exFacileStateFrench.a3;
        a4.text=exFacileStateFrench.a4;
        a5.text=exFacileStateFrench.a5;
        a6.text=exFacileStateFrench.a6;
        a7.text=exFacileStateFrench.a7;
        a8.text= exFacileStateFrench.a8;
        a9.text=exFacileStateFrench.a9;
        a10.text=exFacileStateFrench.a10;
        a11.text=exFacileStateFrench.a11;
        a12.text=exFacileStateFrench.a12;
        a13.text=exFacileStateFrench.a13;
        a14.text=exFacileStateFrench.a14;
        a15.text=exFacileStateFrench.a15;

    }

    function pushState(){
        exFacileStateFrench.a1=a1.text;
        exFacileStateFrench.a2=a2.text;
        exFacileStateFrench.a3=a3.text;
        exFacileStateFrench.a4=a4.text;
        exFacileStateFrench.a5=a5.text;
        exFacileStateFrench.a6=a6.text;
        exFacileStateFrench.a7=a7.text;
        exFacileStateFrench.a8=a8.text;
        exFacileStateFrench.a9=a9.text;
        exFacileStateFrench.a10=a10.text;
        exFacileStateFrench.a11=a11.text;
        exFacileStateFrench.a12=a12.text;
        exFacileStateFrench.a13=a13.text;
        exFacileStateFrench.a14=a14.text;
        exFacileStateFrench.a15=a15.text;

        exFacileStateFrench.writeState();
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        Text{
            Layout.fillWidth: true
            text:"Complète le texte en conjuguant les verbes au temps indiqué entre parenthèses."
            wrapMode: Text.WordWrap
            font.family: "Helvetica"
            font.pointSize: 14
            fontSizeMode: Text.Fit;
            minimumPointSize: 12;
        }
        Item{
            id:text_container
            Layout.fillWidth: true
            Layout.fillHeight: true

        ScrollView{
            id: scrollView1
            anchors.fill: parent
            horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
            Flow{
                height: text_container.height
                width: text_container.width
                Text{
                   text:"Je me "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a1
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_1"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>se souvenir</i>, indicatif présent) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"de Paul alors qu’il n’"
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a2
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_2"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>avoir</i>, indicatif imparfait) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"que six ans. Tout le monde "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a3
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_3"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>dire</i>, indicatif imparfait) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"de lui qu’il "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a4
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_4"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>devenir</i>, conditionnel présent) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"un grand virtuose. Ni son professeur ni ses parents ne "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a5
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_5"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>savoir</i>, indicatif imparfait) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"à quel point ces commentaires "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a6
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_6"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>se révéler</i>, conditionnel présent)"
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"justes. À dix-sept ans, selon les dires de spécialistes qui "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a7
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_7"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>surveiller</i>, indicatif présent) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"ses progrès, il "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a8
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_8"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>sembler</i>, conditionnel présent) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"qu’il "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a9
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_9"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>être</i>, subjonctif présent) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"en voie de devenir un musicien émérite. "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               Text{
                   text:"Moi, sa plus grande amie, qui le "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a10
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_10"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>voir</i>, indicatif  présent) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"répéter tous les jours, je suis fière de son talent qui "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a11
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_11"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>paraître</i>, indicatif  présent) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"inné chez lui. "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               Text{
                   text:"Sa sensibilité et sa recherche de la perfection l’ "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a12
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_12"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>inciter</i>, indicatif  présent) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"à redoubler d’effort pour parvenir au but qu’il "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a13
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_13"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>se fixer</i>, indicatif plus-que-parfait) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"il y a de cela de nombreuses années. Qu’il "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a14
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_14"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>pouvoir</i>, subjonctif présent) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"échouer ne l’"
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
               }
               TextField{
                   id:a15
                   font.family: "Helvetica"
                   font.pointSize: 12
                   objectName: "Question_15"
                   onActiveFocusChanged: if(activeFocus){
                                           timer4loggingText.currentObject=this;
                                           logger.write_general_action("Mouse_Select",objectName)
                                         }
                   onTextChanged: timer4loggingText.start();
               }
               Text{
                   text:"(<i>effleurer</i>, indicatif  présent) "
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
                   textFormat: Text.RichText
                   color:"#7f7fff"
               }
               Text{
                   text:"même pas."
                   font.family: "Helvetica"
                   font.pointSize: 12
                   wrapMode: Text.WordWrap
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
                    exFacileStateFrench.complete=true;
                    pushState();
                    root.enabled=false;
                }
            }

        }
    }
}

