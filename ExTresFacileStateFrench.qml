import QtQuick 2.0

Item {
    property bool complete: false
    property string a1;
    property string a2;
    property string a3;
    property string a4;
    property string a5;
    property string a6;
    property string a7;
    property string a8;
    property string a9;
    property string a10;

    property bool completeHasBeenWritten:false
    function writeState(){
        if(completeHasBeenWritten) return;
        if(complete)
            completeHasBeenWritten=true;

         logger.write_exercise_answer(answer_toString(),complete);
    }
    function answer_toString(){
        var tmp="";
        tmp=tmp.concat(a1,"-");
        tmp=tmp.concat(a2,"-");
        tmp=tmp.concat(a3,"-");
        tmp=tmp.concat(a4,"-");
        tmp=tmp.concat(a5,"-");
        tmp=tmp.concat(a6,"-");
        tmp=tmp.concat(a7,"-");
        tmp=tmp.concat(a8,"-");
        tmp=tmp.concat(a9,"-");
        tmp=tmp.concat(a10);
        return tmp;
    }
}
