import QtQuick 2.0

Item {
    property bool complete: false
    property string answer

    property bool completeHasBeenWritten:false

    function writeState(){
        if(completeHasBeenWritten) return;
        if(complete)
            completeHasBeenWritten=true;

        logger.write_exercise_answer(answer,complete)
    }
    function answer_toString(){
        return answer;
    }
}
