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

    property int condition:1 //Math==1 French==2
    property bool exitFlag: false

    property int page:0
    onPageChanged: {
        if(page==1 && window.condition==1){
            page_loader.source="qrc:/ExercisePageMath.qml"
        }
        else if(page==1 && window.condition==2){
            page_loader.source="qrc:/ExercisePageFrench.qml"
        }
        else if(page==2){
            page_loader.source="qrc:/QuestionnairePage.qml"
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

    Loader{
        id:page_loader
        anchors.fill: parent
        source: "qrc:/InstructionsPage.qml"

    }

    MessageDialog {
        id: exit_message
        visible: false
        title: "Quitter"
        text: "Es-tu sûr de vouloir quitter?"
        onYes: {
            exitFlag=true
            Qt.quit();
        }
        onNo:{
            visible=false
        }
        standardButtons: StandardButton.Yes| StandardButton.No
    }

    onClosing: {
        if(!exitFlag){
            close.accepted = false;
            exit_message.visible=true;
        }
    }
}
