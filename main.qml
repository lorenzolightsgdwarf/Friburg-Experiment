import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import Logger 1.0
Window {
    id:window
    visible: true
    visibility: "Maximized"
    width: Screen.width
    height: Screen.height
    title: qsTr("Friburg Experiment")
    color: "#e3f2fd"

    property variant exercises: {
        'easy':'qrc:/exercices/exercises/ex1.png',
                'medium':'qrc:/exercices/exercises/ex2.png',
                'difficult':'qrc:/exercices/exercises/ex3.png'
    }
    property bool showBanner:enable_banner_CB.checked
    property bool started: false
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

    Component.onCompleted: logger.init();

    Logger{
        id:logger
        onErrorChanged: {
            messageBox.text=error
            messageBox.title="Error"
            messageBox.visible=true
        }

    }
    MessageDialog {
        id: messageBox
        visible: false
        title: "Error"
        text: ""
        onRejected: {
            Qt.quit()
        }
        standardButtons: StandardButton.Close
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

        ListModel{
            id:online_avatars
        }

        Timer{
            interval: 15000
            running: showBanner && started
            repeat: true
            onTriggered : {
                var n=Math.round(Math.random()*4 +1);
                while(n == online_avatars.count ){
                    n=Math.round(Math.random()*(max_avatars-1) +1);
                }
                if(online_avatars.count < n){
                    //ADD
                    while(online_avatars.count<n)
                        online_avatars.append(avatar_list_model.get(Math.round(Math.random()*(avatar_list_model.count-1))))
                }
                else{
                    //REMOVE
                    while(online_avatars.count>n)
                        online_avatars.remove(Math.round(Math.random()*(online_avatars.count-1)));
                }
                var i=0;
                var avatarsId=""
                while(i<online_avatars.count){
                    avatarsId=avatarsId+online_avatars.get(i).name+",";
                    i++;
                }
                logTextAreas();
                logger.write_update_online_avatars(online_avatars.count,avatarsId)
            }
        }

        Rectangle{
            id:people_placeHolder
            visible: showBanner
            color: "#2196f3"
            width: height*max_avatars+20
            height: 0.5*parent.height
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
                width: online_avatars.count*height
                model: online_avatars
                orientation:ListView.Horizontal
                delegate:
                    Item{
                    width: people_placeHolder.height
                    height:width
                    Image{
                        anchors.fill: parent
                        anchors.centerIn: parent
                        id:avatar_img
                        fillMode: Image.PreserveAspectFit
                        source: img_url
                    }
                }
            }
        }
    }
    Item{
        anchors.bottom: parent.bottom
        height:0.9*parent.height
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
                            id:easy
                            color: "#90caf9"
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Text {
                                text: "Easy"
                                anchors.fill: parent
                                anchors.margins: 10
                                verticalAlignment:Text.AlignVCenter
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
                                onClicked: ex_selector.state="easy";
                            }
                        }
                        Rectangle{
                            id:medium
                            color: "#90caf9"
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Text {
                                anchors.fill: parent
                                anchors.margins: 10
                                verticalAlignment:Text.AlignVCenter
                                text: "Medium"
                                font.family: "Helvetica"
                                font.pointSize: 24
                                color: parent.color=="#90caf9"?"black":"white"
                            }
                            Rectangle{
                                color:"orange"
                                anchors.verticalCenter: parent.verticalCenter
                                width: parent.height-10
                                height: width
                                anchors.margins: 10
                                radius: width/2
                                anchors.right: parent.right
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: ex_selector.state="medium";
                            }
                        }
                        Rectangle{
                            id:difficult
                            color: "#90caf9"
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Text {
                                text: "Difficult"
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
                                onClicked: ex_selector.state="difficult";
                            }
                        }
                    }
                }

                Item{
                    height: 0.9*parent.height
                    width: parent.width
                    anchors.bottom: parent.bottom
                    //                    border.width: 1
                    Image{
                        id:img_exercise
                        width: parent.width
                        height:parent.height-75
                        anchors.top:parent.top
                        anchors.bottom: answer_text.top
                        anchors.margins: 1
                        fillMode: Image.PreserveAspectFit
                        source:""
                        Text{
                            visible: img_exercise.source!="" ? false: true
                            text: "Select an exercise from above"
                            anchors.fill: parent
                            anchors.margins: 10
                            verticalAlignment:Text.AlignVCenter
                            font.family: "Helvetica"
                            font.pointSize: 24
                        }
                    }
                    Item{
                        id:answer_text
                        visible: img_exercise.source=="" ? false: true
                        anchors.margins: 5
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height:75
                        TextArea{
                            id:answer_text_easy
                            anchors.fill: parent
                            enabled: visible
                            visible:ex_selector.state=="easy"
                            text:"Enter Answer"
                            property string prev: "Enter Answer"
                            font.family: "Helvetica"
                            font.pointSize: 14
                            wrapMode: Text.WordWrap
                        }
                        TextArea{
                            id:answer_text_medium
                            anchors.fill: parent
                            enabled: visible
                            text:"Enter Answer"
                            property string prev: "Enter Answer"
                            visible:ex_selector.state=="medium"
                            font.family: "Helvetica"
                            font.pointSize: 14
                            wrapMode: Text.WordWrap
                        }
                        TextArea{
                            id:answer_text_difficult
                            anchors.fill: parent
                            enabled: visible
                            text:"Enter Answer"
                            property string prev: "Enter Answer"
                            visible:ex_selector.state=="difficult"
                            font.family: "Helvetica"
                            font.pointSize: 14
                            wrapMode: Text.WordWrap
                        }
                    }
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
                                Item{
                                width: avatar_selection_placeHolder.width
                                height:avatar_img.height
                                Image{
                                    anchors.centerIn: parent
                                    id:avatar_img
                                    width: 0.5*avatar_selection_placeHolder.width
                                    fillMode: Image.PreserveAspectFit
                                    source: img_url
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            avatar_list_view.currentIndex=index
                                            logTextAreas();
                                            logger.write_select_avatar(name);
                                        }
                                    }
                                }
                            }
                            highlight: Rectangle { color: "#2962ff"; radius: 5 }
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

    Rectangle {
        id:splash_screen
        onVisibleChanged: if(!visible){
                              started=true;
                              logger.write_start_experiment()
                          }
        anchors.fill: parent
        color:"#e3f2fd"
        Rectangle{
            id:welcome
            color:"#2196f3"
            width: 2/3*parent.width
            height: parent.height-20
            anchors.centerIn: parent
            anchors.margins: 10
            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
            }
            Rectangle{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top:parent.top
                anchors.margins: 10
                color:"#2962ff"
                width:  2/3*parent.width
                height: Math.min(16/9*width,parent.height-20)
                Text {
                    anchors.centerIn: parent
                    text: "WelCome\n Click to Start"
                    color:"white"
                    font.family: "Helvetica"
                    font.pointSize: 24
                    antialiasing: true
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {welcome.visible=false;instruction.visible=true}
                }
                Rectangle{
                    color:"#00e676"
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.margins: 10
                    width:  75
                    height:width
                    radius: width/2
                    Image {
                        source: "qrc:/settings.png"
                        anchors.fill: parent
                    }
                    layer.enabled: true
                    layer.effect: DropShadow {
                        transparentBorder: true
                    }
                    MouseArea{
                        anchors.fill: parent;
                        onPressed: parent.layer.enabled=false
                        onReleased: parent.layer.enabled=true
                        onClicked: settings.visible=true
                    }
                }

            }



        }
        Rectangle{
            id:instruction
            visible: false
            onVisibleChanged: if(visible) {
                                  if(enable_banner_CB)
                                      logger.write_read_instruction("Avatar_Online_Enabled")
                                  else
                                      logger.write_read_instruction("Avatar_Online_Disabled")
                              }
            color:"#2962ff"
            width: 2/3*parent.width
            height: parent.height-20
            anchors.centerIn: parent
            anchors.margins: 10
            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
            }
            ColumnLayout{
                id:instruction_zone
                spacing: 10
                anchors.fill: parent
                Text{
                    id:title
                    text:"Instructions"
                    font.family: "Helvetica"
                    font.pointSize: 24
                    Layout.alignment: Qt.AlignHCenter
                    antialiasing: true
                }
                Image{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/instruction.png"
                }
                Item{
                    Layout.preferredHeight: 150
                    Layout.fillWidth: true
                    Rectangle{
                        anchors.centerIn:  parent
                        anchors.margins: 10
                        width: 100
                        color:"#00e676"
                        height: width
                        radius: width/2
                        layer.enabled: true
                        layer.effect: DropShadow {
                            transparentBorder: true
                        }
                        Image {
                            source: "qrc:/Button-Next.png"
                            anchors.fill: parent
                        }
                        MouseArea{
                            anchors.fill: parent;
                            onPressed: parent.layer.enabled=false
                            onReleased: parent.layer.enabled=true
                            onClicked: splash_screen.visible=false
                        }
                    }

                }

            }

        }
        Rectangle{
            id:settings
            color: "#EE000000"
            anchors.fill: parent
            visible: false
            Rectangle{
                color:"#1565c0"
                anchors.centerIn: parent
                height: 2/3*parent.height
                width: 3/4*height

                Column{
                    anchors.margins: 20
                    anchors.centerIn: parent
                    spacing: 20
                    TextField{
                        anchors.margins: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        id:pin
                        placeholderText: "Insert Pin"
                    }
                    CheckBox {
                        id:enable_banner_CB
                        anchors.horizontalCenter: parent.horizontalCenter
                        enabled: pin.text=="0101"
                        text: qsTr("Enable Avatar Banner")
                        checked: true
                    }
                    Button{
                        text: "Close"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: settings.visible=false
                    }
                }

            }

        }


    }

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

}
