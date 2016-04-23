import QtQuick 2.0

Item {
    property bool complete: false
    property string q1;
    property string q2;
    property string q3;
    property string q4;
    property bool completeHasBeenWritten:false

    function writeState(){
        if(completeHasBeenWritten) return;
        if(complete)
            completeHasBeenWritten=true;

        logger.write_exercise_answer(answer_toString(),complete);
    }
    function answer_toString(){
        var tmp="";
        tmp=tmp.concat("{",q1,"-",q2,"-",q3,"-",q4,"}");
        return tmp;
    }
}
