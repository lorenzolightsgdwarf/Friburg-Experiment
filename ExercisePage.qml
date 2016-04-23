import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
Item {

    ExDifficileState{
        id:exDifficileState
    }
    ExFacileState{
        id:exFacileState
    }
    ExTresDifficileState{
        id:exTresDifficileState
    }
    ExTresFacileState{
        id:exTresFacileState
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

    Timer{
        id:online_avatars_update_timer
        property int nextAvatar:0
        interval: nextAvatar==0 ? 10*online_avatars.get(nextAvatar).arrivalTime :
                                  10*online_avatars.get(nextAvatar).arrivalTime - online_avatars.get(nextAvatar-1).arrivalTime
        running:window.condition>0
        onTriggered: {
            nextAvatar++
            logger.write_update_online_avatars(nextAvatar.toString());
            online_avatars.setProperty(nextAvatar-1,"activated",true)
            if(nextAvatar<online_avatars.count)
                start()
        }
    }


    Rectangle{
        id:people_placeHolder
        visible: window.condition>0
        color: "transparent"
        border.color: "black"
        border.width: 1
        width: Math.min(online_avatars_update_timer.nextAvatar*(height+5),0.8*parent.width)
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
            model: online_avatars
            orientation:ListView.Horizontal
            currentIndex: online_avatars_update_timer.nextAvatar-1
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

    Item{
        id:ex_placeHolder
        height:  0.72*parent.height
        width: 0.8*parent.width
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0.1*parent.height
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
                            color: exTresFacileState.complete ? "#441976d2" :"#1976d2"
                        }
                        PropertyChanges {
                            target: exercises_loader
                            source:"qrc:/ExerciseTresFacile.qml"
                        }
                        StateChangeScript{
                            script: {
                                logger.write_select_exercise("tres_facile",exTresFacileState.complete,exTresFacileState.answer_toString())
                            }
                        }
                    },
                    State {
                        name: "facile"
                        PropertyChanges {
                            target: facile
                            color: exFacileState.complete ? "#441976d2" :"#1976d2"
                        }
                        PropertyChanges {
                            target: exercises_loader
                            source:"qrc:/ExerciseFacile.qml"
                        }
                        StateChangeScript{
                            script: {
                                logger.write_select_exercise("facile",exFacileState.complete,exFacileState.answer_toString())
                            }
                        }
                    },

                    State {
                        name: "difficile"
                        PropertyChanges {
                            target: difficile
                            color: exDifficileState.complete ? "#441976d2" :"#1976d2"
                        }
                        PropertyChanges {
                            target: exercises_loader
                            source:"qrc:/ExerciseDifficile.qml"
                        }
                        StateChangeScript{
                            script: {
                                logger.write_select_exercise("difficile",exDifficileState.complete,exDifficileState.answer_toString())
                            }
                        }
                    },

                    State {
                        name: "tres_difficile"
                        PropertyChanges {
                            target: tres_difficile
                            color: exTresDifficileState.complete ? "#441976d2" :"#1976d2"
                        }
                        PropertyChanges {
                            target: exercises_loader
                            source:"qrc:/ExerciseTresDifficile.qml"
                        }
                        StateChangeScript{
                            script: {
                                logger.write_select_exercise("tres_difficile",exTresDifficileState.complete,exTresDifficileState.answer_toString())
                            }
                        }
                    }

                ]
                Rectangle{
                    id:tres_difficile
                    color: exTresDifficileState.complete? "#4490caf9" :"#90caf9"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Text {
                        text: "Très difficile"
                        anchors.fill: parent
                        anchors.margins: 10
                        verticalAlignment:Text.AlignVCenter
                        font.family: "Helvetica"
                        font.pointSize: 24
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        color: if(parent.color=="#90caf9" || parent.color=="#4490caf9"){
                                   if(exTresDifficileState.complete)
                                       return"#44000000"
                                   else return "black"
                               }else
                                   if(exTresDifficileState.complete)
                                       return"#44FFFFFF"
                                   else return "white"
                    }
                    Rectangle{
                        color:exTresDifficileState.complete? "#44000000" : "black"
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
                    id:facile
                    color: exFacileState.complete? "#4490caf9" :"#90caf9"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Text {
                        anchors.fill: parent
                        anchors.margins: 10
                        verticalAlignment:Text.AlignVCenter
                        text: "Facile"
                        font.family: "Helvetica"
                        font.pointSize: 24
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        color: if(parent.color=="#90caf9" || parent.color=="#4490caf9"){
                                   if(exFacileState.complete)
                                       return"#44000000"
                                   else return "black"
                               }else
                                   if(exFacileState.complete)
                                       return"#44FFFFFF"
                                   else return "white"
                    }
                    Rectangle{
                        color:exFacileState.complete? "#4400FF00" :"green"
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
                    id:difficile
                    color: exDifficileState.complete? "#4490caf9" :"#90caf9"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Text {
                        text: "Difficile"
                        anchors.fill: parent
                        anchors.margins: 10
                        verticalAlignment:Text.AlignVCenter
                        font.family: "Helvetica"
                        font.pointSize: 24
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        color: if(parent.color=="#90caf9" || parent.color=="#4490caf9"){
                                   if(exDifficileState.complete)
                                       return"#44000000"
                                   else return "black"
                               }else
                                   if(exDifficileState.complete)
                                       return"#44FFFFFF"
                                   else return "white"
                    }
                    Rectangle{
                        color:exDifficileState.complete? "#44FF0000" : "red"
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
                    id:tres_facile
                    color: exTresFacileState.complete? "#4490caf9" :"#90caf9"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Text {
                        text: "Très facile"
                        anchors.fill: parent
                        anchors.margins: 10
                        verticalAlignment:Text.AlignVCenter
                        font.family: "Helvetica"
                        font.pointSize: 24
                        fontSizeMode: Text.Fit;
                        minimumPointSize: 12;
                        color: if(parent.color=="#90caf9" || parent.color=="#4490caf9"){
                                   if(exTresFacileState.complete)
                                       return"#44000000"
                                   else return "black"
                               }else
                                   if(exTresFacileState.complete)
                                       return"#44FFFFFF"
                                   else return "white"
                    }
                    Rectangle{
                        color:exTresFacileState.complete? "#440000ff" :"blue"
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
    AvatarDelegate{
        id:current_avatar
        anchors.top:people_placeHolder.top
        anchors.horizontalCenter: avatart_selection_item.horizontalCenter
        width: 0.15*parent.width
        height: 0.22*parent.height
        anchors.margins: 10
        main_avatar_source: ""
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
        height: 0.72*parent.height
        width: 0.18*parent.width
        anchors.left: ex_placeHolder.right
        anchors.top: current_avatar.bottom
        anchors.margins: 10
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
                    fontSizeMode: Text.Fit;
                    minimumPointSize: 12;
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
                }
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



