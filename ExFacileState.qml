import QtQuick 2.0

Item {
    property bool complete: false
    property var answers :["","","","","","","","","","","","","","","","","","","",""]

    property bool completeHasBeenWritten:false
    function writeState(){
        if(completeHasBeenWritten) return;
        if(complete)
            completeHasBeenWritten=true;

         logger.write_exercise_answer(answer_toString(),complete);
    }
    function answer_toString(){
        var tmp="";
        var i=0;
        for(i=0;i<answers.length;i+=2)
            tmp=tmp.concat("{",answers[i],"-",answers[i+1],"}");
        return tmp;
    }
}
