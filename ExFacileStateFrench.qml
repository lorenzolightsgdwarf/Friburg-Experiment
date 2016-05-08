import QtQuick 2.0

Item {
    property bool complete: false
    property string a1:"";
    property string a2:"";
    property string a3:"";
    property string a4:"";
    property string a5:"";
    property string a6:"";
    property string a7:"";
    property string a8:"";
    property string a9:"";
    property string a10:"";
    property string a11:"";
    property string a12:"";
    property string a13:"";
    property string a14:"";
    property string a15:"";

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
        tmp=tmp.concat(a10,"-");
        tmp=tmp.concat(a11,"-");
        tmp=tmp.concat(a12,"-");
        tmp=tmp.concat(a13,"-");
        tmp=tmp.concat(a14,"-");
        tmp=tmp.concat(a15);
        return tmp;
    }
}
