import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
Item {

    ExDifficileStateMath{
        id:exDifficileStateMath
    }
    ExFacileStateMath{
        id:exFacileStateMath
    }
    ExTresFacileStateMath{
        id:exTresFacileStateMath
    }
    ExTresDifficileStateMath{
        id:exTresDifficileStateMath
    }



    MessageDialog{
        id:deconnexion_dialog
        visible:false;
        icon: StandardIcon.Question
        modality:Qt.ApplicationModal
        standardButtons: StandardButton.Abort | StandardButton.Ok
        title:"Déconnexion"
        text:"Es-tu sûr de vouloir te déconnecter?"
        onRejected:{visible=false}
        onAccepted:{
            if(exercises_loader.item)
                exercises_loader.item.pushState();
            logger.write_finish();
            window.page=2
        }
    }

    AvatarListModel{
        id:avatar_list_model
    }
    AvatarBannerListModel{
        id:online_avatars
    }
    ListModel{
        id:current_online_avatars
    }

    Component.onCompleted: {
        online_avatars_update_timer.getNextArrivalTime()
        online_avatars_update_timer.interval=1000*(online_avatars_update_timer.current_value-
                                                   online_avatars_update_timer.last_value);
        online_avatars_update_timer.start();
    }

    Timer{
        id:online_avatars_update_timer
        property real last_value:0
        property real current_value: 0

        running:false;

        onTriggered: {
            updateModel();
            last_value=current_value;
            getNextArrivalTime();
            interval=1000*(current_value-last_value);
            logger.write_update_online_avatars("");
            if(current_value!=99999999)
                start();
        }
        function getNextArrivalTime(){
            var i=0;
            var min=99999999;
            for(i=0;i<online_avatars.count;i++){
                if(online_avatars.get(i).arrivalTime>last_value && online_avatars.get(i).arrivalTime<min){
                    min=online_avatars.get(i).arrivalTime;
                }
            }
            current_value=min;
        }

        function updateModel(){
            var i=0;
            for(i=0;i<online_avatars.count;i++){
                if(current_value==online_avatars.get(i).arrivalTime){
                    if(!online_avatars.get(i).isUpdate){
                        current_online_avatars.append(online_avatars.get(i))
                    }
                    else{
                         current_online_avatars.set(online_avatars.get(i).avatarNumber-1,online_avatars.get(i))
                    }
                }
            }
        }
    }

    Text {
        wrapMode: Text.WordWrap
        text: "Les autres connectés:"
        verticalAlignment:Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        font.family: "Helvetica"
        font.pointSize: 14
        fontSizeMode: Text.Fit;
        minimumPointSize: 12;
        anchors.bottom: people_placeHolder.top
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottomMargin: 2


    }
    Rectangle{
        id:people_placeHolder
        visible: true
        color: "transparent"
        border.color: "black"
        border.width: 1
        width: Math.min(current_online_avatars.count*(height+2),0.8*parent.width)
        height: 0.16*parent.height
        anchors.bottom: ex_placeHolder.top
        anchors.left: parent.left
        anchors.margins: 10
        ListView{
            id:list_view_online_avatars
            anchors.fill: parent
            anchors.margins: 1
            clip:true
            interactive: false
            spacing: 2
            model: current_online_avatars
            orientation:ListView.Horizontal
            currentIndex: current_online_avatars.count-1
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
                    visible:true
                    selectingAvatar: isSelecting
                    interactive: false
                    transparent:false
                    highlighted: false
                }}
        }
    }

    Item{
        id:ex_placeHolder
        height:  0.72*parent.height
        width: 0.8*parent.width
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0.05*parent.height
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
                        name: "tres_facile"
                        PropertyChanges {
                            target: tres_facile
                            color: exTresFacileStateMath.complete ? "#441976d2" :"#1976d2"
                        }
                        PropertyChanges {
                            target: exercises_loader
                            source:"qrc:/ExerciseTresFacileMath.qml"
                        }
                        StateChangeScript{
                            script: {
                                logger.write_select_exercise("exercise_blu",exTresFacileStateMath.complete,exTresFacileStateMath.answer_toString())
                            }
                        }
                    },
                    State {
                        name: "facile"
                        PropertyChanges {
                            target: facile
                            color: exFacileStateMath.complete ? "#441976d2" :"#1976d2"
                        }
                        PropertyChanges {
                            target: exercises_loader
                            source:"qrc:/ExerciseFacileMath.qml"
                        }
                        StateChangeScript{
                            script: {
                                logger.write_select_exercise("exercise_green",exFacileStateMath.complete,exFacileStateMath.answer_toString())
                            }
                        }
                    },

                    State {
                        name: "difficile"
                        PropertyChanges {
                            target: difficile
                            color: exDifficileStateMath.complete ? "#441976d2" :"#1976d2"
                        }
                        PropertyChanges {
                            target: exercises_loader
                            source:"qrc:/ExerciseDifficileMath.qml"
                        }
                        StateChangeScript{
                            script: {
                                logger.write_select_exercise("exercise_red",exDifficileStateMath.complete,exDifficileStateMath.answer_toString())
                            }
                        }
                    },

                    State {
                        name: "tres_difficile"
                        PropertyChanges {
                            target: tres_difficile
                            color: exTresDifficileStateMath.complete ? "#441976d2" :"#1976d2"
                        }
                        PropertyChanges {
                            target: exercises_loader
                            source:"qrc:/ExerciseTresDifficileMath.qml"
                        }
                        StateChangeScript{
                            script: {
                                logger.write_select_exercise("exercise_black",exTresDifficileStateMath.complete,exTresDifficileStateMath.answer_toString())
                            }
                        }
                    }
                ]
                Rectangle{
                    id:tres_difficile
                    color: exTresDifficileStateMath.complete? "#4490caf9" :"#90caf9"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Text {
                        text: "Exercice"
                        anchors.fill: parent
                        anchors.margins: 10
                        verticalAlignment:Text.AlignVCenter
                        font.family: "Helvetica"
                        font.pointSize: 24
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        color: if(parent.color=="#90caf9" || parent.color=="#4490caf9"){
                                   if(exTresDifficileStateMath.complete)
                                       return"#44000000"
                                   else return "black"
                               }else
                                   if(exTresDifficileStateMath.complete)
                                       return"#44FFFFFF"
                                   else return "white"
                    }
                    Rectangle{
                        color:exTresDifficileStateMath.complete? "#44000000" : "black"
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.height-10
                        height: width
                        anchors.margins: 10
                        radius: width/2
                        anchors.right: parent.right
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(exercises_loader.item)
                                exercises_loader.item.pushState();
                            ex_selector.state="tres_difficile";
                        }
                    }
                }
                Rectangle{
                    id:difficile
                    color: exDifficileStateMath.complete? "#4490caf9" :"#90caf9"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Text {
                        text: "Exercice"
                        anchors.fill: parent
                        anchors.margins: 10
                        verticalAlignment:Text.AlignVCenter
                        font.family: "Helvetica"
                        font.pointSize: 24
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        color: if(parent.color=="#90caf9" || parent.color=="#4490caf9"){
                                   if(exDifficileStateMath.complete)
                                       return"#44000000"
                                   else return "black"
                               }else
                                   if(exDifficileStateMath.complete)
                                       return"#44FFFFFF"
                                   else return "white"
                    }
                    Rectangle{
                        color:exDifficileStateMath.complete? "#44FF0000" : "red"
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.height-10
                        height: width
                        anchors.margins: 10
                        radius: width/2
                        anchors.right: parent.right
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(exercises_loader.item)
                                exercises_loader.item.pushState();
                            ex_selector.state="difficile";
                        }
                    }
                }
                Rectangle{
                    id:facile
                    color: exFacileStateMath.complete? "#4490caf9" :"#90caf9"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Text {
                        anchors.fill: parent
                        anchors.margins: 10
                        verticalAlignment:Text.AlignVCenter
                        text: "Exercice"
                        font.family: "Helvetica"
                        font.pointSize: 24
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        color: if(parent.color=="#90caf9" || parent.color=="#4490caf9"){
                                   if(exFacileStateMath.complete)
                                       return"#44000000"
                                   else return "black"
                               }else
                                   if(exFacileStateMath.complete)
                                       return"#44FFFFFF"
                                   else return "white"
                    }
                    Rectangle{
                        color:exFacileStateMath.complete? "#4400FF00" :"green"
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.height-10
                        height: width
                        anchors.margins: 10
                        radius: width/2
                        anchors.right: parent.right
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(exercises_loader.item)
                                exercises_loader.item.pushState();
                            ex_selector.state="facile";
                        }
                    }
                }
                Rectangle{
                    id:tres_facile
                    color: exTresFacileStateMath.complete? "#4490caf9" :"#90caf9"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Text {
                        text: "Exercice"
                        anchors.fill: parent
                        anchors.margins: 10
                        verticalAlignment:Text.AlignVCenter
                        font.family: "Helvetica"
                        font.pointSize: 24
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        color: if(parent.color=="#90caf9" || parent.color=="#4490caf9"){
                                   if(exTresFacileStateMath.complete)
                                       return"#44000000"
                                   else return "black"
                               }else
                                   if(exTresFacileStateMath.complete)
                                       return"#44FFFFFF"
                                   else return "white"
                    }
                    Rectangle{
                        color:exTresFacileStateMath.complete? "#440000ff" :"blue"
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.height-10
                        height: width
                        anchors.margins: 10
                        radius: width/2
                        anchors.right: parent.right
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(exercises_loader.item)
                                exercises_loader.item.pushState();
                            ex_selector.state="tres_facile";
                        }
                    }
                }
            }
        }
        Loader{
            id:exercises_loader
            height: 0.9*parent.height
            width: parent.width
            anchors.bottom: parent.bottom
            onLoaded: item.pullState();
        }
    }
    Text {
        id:moi_connecte
        wrapMode: Text.WordWrap
        width: current_avatar.width-10
        text: "Moi connecté:"
        verticalAlignment:Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        font.family: "Helvetica"
        font.pointSize: 14
        fontSizeMode: Text.Fit;
        minimumPointSize: 12;
        anchors.bottom: current_avatar.top
        anchors.horizontalCenter: current_avatar.horizontalCenter
        anchors.bottomMargin: 2
    }
    AvatarDelegate{
        id:current_avatar
        anchors.top:people_placeHolder.top
        anchors.right: parent.right
        anchors.rightMargin: 10
        width: 0.15*parent.width
        height: 0.22*parent.height
        main_avatar_source: "qrc:/avatars/avatar_imgs/Primary/0.png"
        name:"anonymous"
        onNameChanged: logger.write_select_avatar(name,mini_avatar_friends_enabled,mini_avatar_sport_enabled,
                                                  mini_avatar_livre_enabled,mini_avatar_telephone_enabled);
        onMini_avatar_friends_enabledChanged:  logger.write_select_avatar(name,mini_avatar_friends_enabled,mini_avatar_sport_enabled,
                                                                          mini_avatar_livre_enabled,mini_avatar_telephone_enabled);
        onMini_avatar_livre_enabledChanged:  logger.write_select_avatar(name,mini_avatar_friends_enabled,mini_avatar_sport_enabled,
                                                                        mini_avatar_livre_enabled,mini_avatar_telephone_enabled);
        onMini_avatar_sport_enabledChanged:  logger.write_select_avatar(name,mini_avatar_friends_enabled,mini_avatar_sport_enabled,
                                                                        mini_avatar_livre_enabled,mini_avatar_telephone_enabled);
        onMini_avatar_telephone_enabledChanged:  logger.write_select_avatar(name,mini_avatar_friends_enabled,mini_avatar_sport_enabled,
                                                                            mini_avatar_livre_enabled,mini_avatar_telephone_enabled);
        transparent: false
        highlighted: true
        interactive: false
    }

    Item{
        id:avatart_selection_item
        height: 0.70*parent.height
        width: 0.13*parent.width
        anchors.horizontalCenter: current_avatar.horizontalCenter
        anchors.top: current_avatar.bottom
        anchors.margins: 10
        Rectangle{
            id:avatar_selection_placeHolder
            color: "#64b5f6"
            width: parent.width
            height: 0.8*parent.height
            ColumnLayout{
                width: parent.width-17;
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.margins: 5
                ListView{
                    id:avatar_list_view
                    clip:true
                    onMovementStarted: scrolltimer4log.start()
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    currentIndex:-1
                    model: avatar_list_model
                    delegate:
                        AvatarDelegate{
                        name: avatar_name
                        main_avatar_source: img_url
                        onMini_avatar_friends_enabledChanged:
                            current_avatar.mini_avatar_friends_enabled=mini_avatar_friends_enabled
                        onMini_avatar_livre_enabledChanged:
                            current_avatar.mini_avatar_livre_enabled=mini_avatar_livre_enabled
                        onMini_avatar_sport_enabledChanged:
                            current_avatar.mini_avatar_sport_enabled=mini_avatar_sport_enabled
                        onMini_avatar_telephone_enabledChanged:
                            current_avatar.mini_avatar_telephone_enabled=mini_avatar_telephone_enabled
                        onTransparentChanged:{
                            mini_avatar_friends_enabled=current_avatar.mini_avatar_friends_enabled
                            mini_avatar_livre_enabled=current_avatar.mini_avatar_livre_enabled
                            mini_avatar_sport_enabled=current_avatar.mini_avatar_sport_enabled
                            mini_avatar_telephone_enabled=current_avatar.mini_avatar_telephone_enabled
                        }
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
                                    current_avatar.main_avatar_source=main_avatar_source;
                                    current_avatar.name=name;
                                }
                                mouse.accepted = false
                            }
                        }

                    }

                    Timer{
                        id:scrolltimer4log
                        running: false
                        interval: 10000
                        onRunningChanged: if(running){
                                              logger.write_general_action("Scrolling_Avatars")
                                          }
                    }

                }
            }
            ScrollBar {
                id: verticalScrollBar
                width: 12; height: parent.height-12
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 2
                opacity: 1
                orientation: Qt.Vertical
                position: Math.max(Math.min(avatar_list_view.visibleArea.yPosition,1),0)
                pageSize: avatar_list_view.visibleArea.heightRatio
            }
        }
        Rectangle{
            anchors.horizontalCenter: avatar_selection_placeHolder.horizontalCenter
            anchors.top: avatar_selection_placeHolder.bottom
            anchors.margins: 10
            width: text_deconnexion.width+10
            height: text_deconnexion.height+10
            color: "#00e676"
            radius: 10
            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
            }
            Text{
                id:text_deconnexion
                text:"Déconnexion"
                font.family: "Helvetica"
                font.pointSize: 16
                font.bold: true
                fontSizeMode: Text.Fit;
                minimumPointSize: 12;
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent;
                onPressed: parent.layer.enabled=false
                onReleased: parent.layer.enabled=true
                onClicked: deconnexion_dialog.visible=true
            }
        }
    }
}



