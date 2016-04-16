import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
Item {

    property int max_avatars: 6

    property variant activeTextArea

    function logTextAreas(){
        if(activeTextArea){
            if(activeTextArea.prev!=activeTextArea.text){
                if(activeTextArea==answer_text_easy)
                    logger.write_exercise_answer("easy",activeTextArea.text)
                else if(activeTextArea==answer_text_medium)
                    logger.write_exercise_answer("medium",activeTextArea.text)
                else if(activeTextArea==answer_text_difficult)
                    logger.write_exercise_answer("difficult",activeTextArea.text)
            }
            activeTextArea.prev=activeTextArea.text;
        }
    }
    Timer{
        repeat: true
        interval: 2000
        running: true
        onIntervalChanged: logTextAreas();
    }


    AvatarListModel{
        id:avatar_list_model
    }

    Item{
        height:0.2*parent.height
        width: parent.width
        Timer{
            id:online_avatars_update_timer
            property int nextAvatar:0
            interval: nextAvatar==0 ? 1000*online_avatars.get(nextAvatar).arrivalTime :
                                      1000*online_avatars.get(nextAvatar).arrivalTime - online_avatars.get(nextAvatar-1).arrivalTime
            running:true
            onTriggered: {
                online_avatars.setProperty(nextAvatar,"activated",true)
                nextAvatar++
                if(nextAvatar<online_avatars.count)
                    start()
            }
//            interval: 15000
//            running: showBanner && started
//            repeat: true
//            onTriggered : {
//                var n=Math.round(Math.random()*4 +1);
//                while(n == online_avatars.count ){
//                    n=Math.round(Math.random()*(max_avatars-1) +1);
//                }
//                if(online_avatars.count < n){
//                    //ADD
//                    while(online_avatars.count<n)
//                        online_avatars.append(avatar_list_model.get(Math.round(Math.random()*(avatar_list_model.count-1))))
//                }
//                else{
//                    //REMOVE
//                    while(online_avatars.count>n)
//                        online_avatars.remove(Math.round(Math.random()*(online_avatars.count-1)));
//                }
//                var i=0;
//                var avatarsId=""
//                while(i<online_avatars.count){
//                    avatarsId=avatarsId+online_avatars.get(i).name+",";
//                    i++;
//                }
//                logTextAreas();
//                logger.write_update_online_avatars(online_avatars.count,avatarsId)
//            }
        }
        AvatarBannerListModel{
            id:online_avatars
        }
        Rectangle{
            id:people_placeHolder
            visible: window.condition>0
            color: "#2196f3"
            width: height*max_avatars+20
            height: 0.8*parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 10
            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
            }
            ListView{
                anchors.centerIn: parent
                clip:true
                interactive: false
                height: parent.height
                width: Math.max(online_avatars_update_timer.nextAvatar*height,height)
                model: online_avatars
                orientation:ListView.Horizontal
                delegate:Item{
                    width: people_placeHolder.height
                    height:width
                    AvatarDelegate{
                        width: parent.width
                        height: parent.height
                        anchors.centerIn: parent
                        main_avatar_source: img_url
                        mini_avatar_friends_enabled: friends
                        mini_avatar_livre_enabled: livre
                        mini_avatar_sport_enabled: sport
                        mini_avatar_telephone_enabled: telephone
                        visible:activated
                        interactive: false
                        transparent:false
                        highlighted: false
                    }}
            }
        }
    }


    Item{
        anchors.bottom: parent.bottom
        height:0.8*parent.height
        width: parent.width
        RowLayout{
            anchors.fill: parent
            anchors.margins: 10
            Item{
                id:ex_placeHolder
                Layout.preferredHeight:  0.9*parent.height
                Layout.preferredWidth: 0.8*parent.width
                anchors.margins: 10
                Item {
                    height: 0.1*parent.height
                    width: parent.width
                    RowLayout{
                        anchors.fill: parent
                        id:ex_selector
                        state:"none"
                        states: [
                            State {
                                name: "none"
                            },
                            State {
                                name: "easy"
                                PropertyChanges {
                                    target: easy
                                    color:"#1976d2"
                                }
                                PropertyChanges {
                                    target: img_exercise
                                    source:exercises['easy']
                                }
                                StateChangeScript{
                                    script: {
                                        logTextAreas();
                                        logger.write_select_exercise("easy")
                                    }
                                }
                                PropertyChanges {
                                    target: window
                                    activeTextArea:answer_text_easy
                                }
                            },

                            State {
                                name: "medium"
                                PropertyChanges {
                                    target: medium
                                    color:"#1976d2"
                                }
                                PropertyChanges {
                                    target: img_exercise
                                    source:exercises['medium']
                                }
                                StateChangeScript{
                                    script:{
                                        logTextAreas();
                                        logger.write_select_exercise("medium")
                                    }
                                }
                                PropertyChanges {
                                    target: window
                                    activeTextArea:answer_text_medium
                                }
                            },

                            State {
                                name: "difficult"
                                PropertyChanges {
                                    target: difficult
                                    color:"#1976d2"
                                }
                                PropertyChanges {
                                    target: img_exercise
                                    source:exercises['difficult']
                                }
                                StateChangeScript{
                                    script: {
                                        logTextAreas();
                                        logger.write_select_exercise("difficult")
                                    }
                                }
                                PropertyChanges {
                                    target: window
                                    activeTextArea:answer_text_difficult
                                }
                            }

                        ]
                        Rectangle{
                            id:tres_difficile
                            color: "#90caf9"
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Text {
                                text: "Très difficile"
                                anchors.fill: parent
                                anchors.margins: 10
                                verticalAlignment:Text.AlignVCenter
                                font.family: "Helvetica"
                                font.pointSize: 24
                                color: parent.color=="#90caf9"?"black":"white"
                            }
                            Rectangle{
                                color:"black"
                                anchors.verticalCenter: parent.verticalCenter
                                width: parent.height-10
                                height: width
                                anchors.margins: 10
                                radius: width/2
                                anchors.right: parent.right
                            }
                            MouseArea{
                                anchors.fill: parent
                                //onClicked: ex_selector.state="easy";
                            }
                        }
                        Rectangle{
                            id:facile
                            color: "#90caf9"
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Text {
                                anchors.fill: parent
                                anchors.margins: 10
                                verticalAlignment:Text.AlignVCenter
                                text: "Facile"
                                font.family: "Helvetica"
                                font.pointSize: 24
                                color: parent.color=="#90caf9"?"black":"white"
                            }
                            Rectangle{
                                color:"green"
                                anchors.verticalCenter: parent.verticalCenter
                                width: parent.height-10
                                height: width
                                anchors.margins: 10
                                radius: width/2
                                anchors.right: parent.right
                            }
                            MouseArea{
                                anchors.fill: parent
                                //onClicked: ex_selector.state="medium";
                            }
                        }
                        Rectangle{
                            id:difficile
                            color: "#90caf9"
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Text {
                                text: "Difficile"
                                anchors.fill: parent
                                anchors.margins: 10
                                verticalAlignment:Text.AlignVCenter
                                font.family: "Helvetica"
                                font.pointSize: 24
                                color: parent.color=="#90caf9"?"black":"white"
                            }
                            Rectangle{
                                color:"red"
                                anchors.verticalCenter: parent.verticalCenter
                                width: parent.height-10
                                height: width
                                anchors.margins: 10
                                radius: width/2
                                anchors.right: parent.right
                            }
                            MouseArea{
                                anchors.fill: parent
                               // onClicked: ex_selector.state="difficult";
                            }
                        }
                        Rectangle{
                            id:tres_facile
                            color: "#90caf9"
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Text {
                                text: "Très facile"
                                anchors.fill: parent
                                anchors.margins: 10
                                verticalAlignment:Text.AlignVCenter
                                font.family: "Helvetica"
                                font.pointSize: 24
                                color: parent.color=="#90caf9"?"black":"white"
                            }
                            Rectangle{
                                color:"blue"
                                anchors.verticalCenter: parent.verticalCenter
                                width: parent.height-10
                                height: width
                                anchors.margins: 10
                                radius: width/2
                                anchors.right: parent.right
                            }
                            MouseArea{
                                anchors.fill: parent
                               // onClicked: ex_selector.state="difficult";
                            }
                        }
                    }
                }
                Loader{
                    id:exercises_loader
                    height: 0.9*parent.height
                    width: parent.width
                    anchors.bottom: parent.bottom
                    source: "qrc:/ExerciseDifficile.qml"
                }
               }

            Item{
                Layout.preferredHeight: 0.9*parent.height
                Layout.preferredWidth: 0.18*parent.width
                Rectangle{
                    id:avatar_selection_placeHolder
                    color: "#64b5f6"
                    width: parent.width
                    height: 0.8*parent.height
                    ColumnLayout{
                        anchors.fill: parent
                        anchors.margins: 5
                        Text {
                            wrapMode: Text.WordWrap
                            Layout.maximumWidth: parent.width-10
                            text: "Choose your Avatar:"
                            verticalAlignment:Text.AlignVCenter
                            font.family: "Helvetica"
                            font.pointSize: 20
                        }
                        ListView{
                            id:avatar_list_view
                            clip:true
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            currentIndex:-1
                            model: avatar_list_model
                            delegate:
                                AvatarDelegate{
                                main_avatar_source: img_url
                                transparent: avatar_list_view.currentIndex!=index
                                highlighted: avatar_list_view.currentIndex==index
                                interactive: avatar_list_view.currentIndex==index
                                width: Math.min(avatar_selection_placeHolder.width,150)
                                anchors.horizontalCenter: parent.horizontalCenter
                                MouseArea{
                                    propagateComposedEvents:true
                                    anchors.fill: parent
                                    onClicked: {
                                        if(avatar_list_view.currentIndex!=index){
                                            avatar_list_view.currentIndex=index
                                            logTextAreas();
                                            logger.write_select_avatar(name);
                                        }
                                        mouse.accepted = false
                                    }
                                }

                            }
                        }
                    }
                }
                Rectangle{
                    anchors.horizontalCenter: avatar_selection_placeHolder.horizontalCenter
                    anchors.top: avatar_selection_placeHolder.bottom
                    anchors.margins: 10
                    width: 0.15*parent.height
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
                            started=false;
                            logTextAreas();
                            logger.write_finish();
                            final_questions.visible=true;
                        }
                    }
                }
            }
        }
    }



}
