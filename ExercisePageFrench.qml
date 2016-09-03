import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
Item {

    ExTresDifficileStateFrench{
        id:exBlackStep2State
    }
    ExTresFacileStateFrench{
        id:exBlueStep1State
    }

    ExTresDifficileStateFrench{
        id:exBlackStep1State
    }
    ExTresFacileStateFrench{
        id:exBlueStep2State
    }

    property bool hide_avatars: if(window.page==2 && window.condition==2)
                                   return true
                               else if(window.page==2 && window.condition==1)
                                   return false
                               else if(window.page==3 && window.condition==2)
                                       return false
                               else if(window.page==3 && window.condition==1)
                                       return true
                               else return false;



    MessageDialog{
        id:deconnexion_dialog
        visible:false;
        icon: StandardIcon.Question
        modality:Qt.ApplicationModal
        standardButtons: StandardButton.Abort | StandardButton.Ok
        title:window.page==3 ? "Déconnexion" : "Ètape suivante"
        text:window.page==3 ? "Es-tu sûr de vouloir te déconnecter?" : "Es-tu sûr de vouloir passer à l’étape suivante?"
        onRejected:{visible=false}
        onAccepted:{
            if(exercises_loader.item)
                exercises_loader.item.pushState();
            window.page++
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
        if(!hide_avatars) online_avatars_update_timer.start();
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
            interval=1000*(current_value-last_value)
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
        visible: !hide_avatars
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
        border.color: !hide_avatars? "black":"transparent"
        border.width: 1
        width: Math.min(current_online_avatars.count*(height+2),0.8*parent.width)
        height: 0.16*parent.height
        anchors.bottom: ex_placeHolder.top
        anchors.left: parent.left
        anchors.margins: 10
        ListView{
            visible: !hide_avatars
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
                        name: "blue_step_1"
                        PropertyChanges {
                            target: blue_step_1
                            color: exBlueStep1State.complete ? "#441976d2" :"#1976d2"
                        }
                        PropertyChanges {
                            target: exercises_loader
                            source:"qrc:/ExerciseTresFacileFrench.qml"
                        }
                        StateChangeScript{
                            script: {
                                logger.write_select_exercise("exercise_French_blu",exBlueStep1State.complete,exBlueStep1State.answer_toString())
                            }
                        }
                    },
                    State {
                        name: "black_step_1"
                        PropertyChanges {
                            target: black_step_1
                            color: exBlackStep1State.complete ? "#441976d2" :"#1976d2"
                        }
                        PropertyChanges {
                            target: exercises_loader
                            source:"qrc:/ExerciseTresDifficileFrench.qml"
                        }
                        StateChangeScript{
                            script: {
                                logger.write_select_exercise("exercise_French_black",exBlackStep1State.complete,exBlackStep1State.answer_toString())
                            }
                        }
                    },
                    State {
                        name: "blue_step_2"
                        PropertyChanges {
                            target: blue_step_2
                            color: exBlueStep2State.complete ? "#441976d2" :"#1976d2"
                        }
                        PropertyChanges {
                            target: exercises_loader
                            source:"qrc:/ExerciseTresFacileFrench_v2.qml"
                        }
                        StateChangeScript{
                            script: {
                                logger.write_select_exercise("exercise_French_blu",exBlueStep2State.complete,exBlueStep2State.answer_toString())
                            }
                        }
                    },

                    State {
                        name: "black_step_2"
                        PropertyChanges {
                            target: black_step_2
                            color: exBlackStep2State.complete ? "#441976d2" :"#1976d2"
                        }
                        PropertyChanges {
                            target: exercises_loader
                            source:"qrc:/ExerciseTresDifficileFrench_v2.qml"
                        }
                        StateChangeScript{
                            script: {
                                logger.write_select_exercise("exercise_French_black",exBlackStep2State.complete,exBlackStep2State.answer_toString())
                            }
                        }
                    }
                ]
                Rectangle{
                    id:black_step_1
                    visible: window.page==2
                    color: exBlackStep1State.complete? "#4490caf9" :"#90caf9"
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
                                   if(exBlackStep1State.complete)
                                       return"#44000000"
                                   else return "black"
                               }else
                                   if(exBlackStep1State.complete)
                                       return"#44FFFFFF"
                                   else return "white"
                    }
                    Rectangle{
                        color:exBlackStep1State.complete? "#44000000" : "black"
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
                            ex_selector.state="black_step_1";
                        }
                    }
                }
                Rectangle{
                    id:blue_step_1
                    visible: window.page==2
                    color: exBlueStep1State.complete? "#4490caf9" :"#90caf9"
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
                                   if(exBlueStep1State.complete)
                                       return"#44000000"
                                   else return "black"
                               }else
                                   if(exBlueStep1State.complete)
                                       return"#44FFFFFF"
                                   else return "white"
                    }
                    Rectangle{
                        color:exBlueStep1State.complete? "#440000ff" :"blue"
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
                            ex_selector.state="blue_step_1";
                        }
                    }
                }
                Rectangle{
                    id:blue_step_2
                    visible: window.page==3
                    color: exBlueStep2State.complete? "#4490caf9" :"#90caf9"
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
                                   if(exBlueStep2State.complete)
                                       return"#44000000"
                                   else return "black"
                               }else
                                   if(exBlueStep2State.complete)
                                       return"#44FFFFFF"
                                   else return "white"
                    }
                    Rectangle{
                        color:exBlueStep2State.complete? "#4400FF00" :"blue"
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
                            ex_selector.state="blue_step_2";
                        }
                    }
                }
                Rectangle{
                    id:black_step_2
                    visible: window.page==3
                    color: exBlackStep2State.complete? "#4490caf9" :"#90caf9"
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
                                   if(exBlackStep2State.complete)
                                       return"#44000000"
                                   else return "black"
                               }else
                                   if(exBlackStep2State.complete)
                                       return"#44FFFFFF"
                                   else return "white"
                    }
                    Rectangle{
                        color:exBlackStep2State.complete? "#44FF0000" : "black"
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
                            ex_selector.state="black_step_2";
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
        visible: !hide_avatars
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
        isPlaceHolder: hide_avatars
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
            color: !hide_avatars ? "#64b5f6" : "transparent"
            width: parent.width
            height: 0.8*parent.height
            ColumnLayout{
                visible: !hide_avatars
                width: parent.width-17;
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.margins: 5
                ListView{
                    id:avatar_list_view
                    clip:true
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    currentIndex:-1
                    onMovementEnded: scrolltimer4log.start()
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
                visible: !hide_avatars
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
            width: parent.width-20
            height: parent.height*0.15
            color: "#00e676"
            radius: 10
            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
            }
            Text{
                id:text_deconnexion
                text: window.page==3 ? "Déconnexion" :"Passer à l’étape suivante"
                font.family: "Helvetica"
                font.pointSize: 16
                font.bold: true
                fontSizeMode: Text.Fit;
                wrapMode: Text.WordWrap
                minimumPointSize: 12;
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
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



