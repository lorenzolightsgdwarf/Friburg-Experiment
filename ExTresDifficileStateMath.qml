import QtQuick 2.0

Item {
    property bool complete: false
    property string q1;
    property string q2;
    property string q3;
    property string q4;
    property string q5;
    property string q6;
    property string q7;
    property string q8;

    property bool completeHasBeenWritten:false


    function writeState(){
        if(completeHasBeenWritten) return;
        if(complete)
            completeHasBeenWritten=true;

        logger.write_exercise_answer(answer_toString(),complete);
    }
    function answer_toString(){
        var tmp="";
        tmp=tmp.concat("{",q1,"-",q2,"-",q3,"-",q4,"-",q5,"-",q6,"-",q7,"-",q8,"}");
        return tmp;
    }
}
