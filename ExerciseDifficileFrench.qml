import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2

Item{
    id:root


    function pullState(){
        root.enabled=!exDifficileStateFrench.complete
        q1.text=exDifficileStateFrench.q1
        q2.text=exDifficileStateFrench.q2
        q3.text=exDifficileStateFrench.q3
        q4.text=exDifficileStateFrench.q4
    }

    function pushState(){
        exDifficileStateFrench.q1=q1.text
        exDifficileStateFrench.q2=q2.text
        exDifficileStateFrench.q3=q3.text
        exDifficileStateFrench.q4=q4.text

        exDifficileStateFrench.writeState();
    }
    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        Text{
            Layout.fillWidth: true
            text:"Lis attentivement ces quatre débuts de roman, puis réponds à la question."
            wrapMode: Text.WordWrap
            font.family: "Helvetica"
            font.pointSize: 14
            fontSizeMode: Text.Fit;
            minimumPointSize: 12;
        }
        TextArea{
            id:text_area
            Layout.fillWidth: true
            Layout.preferredHeight: 0.5*root.height
            text:"
<i><b>Extrait 1:</b> Kamo. L’agence Babel</i><br>
<p style=\"margin-left:10px\">
-Trois sur vingt en anglais!<br>
La mère de Kamo jetait le carnet de notes sur la toile cirée.<br>
-Tu es content de toi?<br>
Elle le jetait parfois si violemment que Kamo faisait un bond pour éviter le café renversé.<br>
-Mais j’ai eu  dix-huit en histoire!<br>
Elle épongeait le café d’un geste circulaire et une seconde tasse fumait aussitôt sous le nez de son fils.<br>
- Tu pourrais bien avoir vingt-cinq sur vingt en histoire, ça ne me ferait pas avaler ton trois en anglais!<br>
</p>
<div align=\"right\"><small>Daniel Pennac (né en 1944), Kamo. L’agence Babel (1992)<br>\u00A9 éd. Gallimard Jeunesse.</small></div><br>
<br><div align=\"left\"><i><b>Extrait 2:</b> Enquête au collège</i><br>
<p style=\"margin-left:10px\">Il y a des jours où il vaudrait mieux rester au lit.
Je ne dis pas ça par amour pour les polochons de l’internat. Quand la cloche a sonné, ce matin, j’ai cru un instant que j’avais été transformé en sardine à l’huile marinant dans une boîte de fer-blanc. La vision de mes pieds nus dépassant des barreaux ne m’a rassuré qu’à moitié : j’étais bien Rémi Pharamon, pensionnaire de 4e 2 au collège Chateaubriand et rien […] ne pouvait me sauver de l’interro de sciences-nat<sup>1</sup>.</p></div>
<div align=\"right\"><small>Jean-Philippe Arrou-Vignod (né en 1958), Enquête au collège (1991)<br>\u00A9 éd. Gallimard.</small></div>
<div align=\"left\"><small><b><br>1.sciences-nat:</b> biologie</small></div>
<br><div align=\"left\"><i><b>Extrait 3:</b> Le Violon maudit</i><br>
<p style=\"margin-left:10px\">Un spectre hantait la maison Coquelin. Ce n’était pas un de ces abominables revenants qui déambulent après minuit drapés d’un suaire douteux, en faisant tinter leurs chaînes, non. Le fantôme des Coquelin portait une robe de satin vert et arborait, sous de longs cheveux blonds, le gracieux visage d’une jeune femme –celui d’Adèle Coquelin, aïeule de la famille, morte au début du siècle à la fleur de son âge.
Âme désinvolte, elle apparaissait à toute heure du jour ou de la nuit, flottant à sa guise entre sols et plafonds à travers la demeure. N’empêche qu’il s’agissait bel et bien d’un spectre, et comme tout le pays était au courant, personne n’aurait mis les pieds chez les Coquelin sans y être obligé.</p></div>
<div align=\"right\"><small>Michel Grimaud (né en 1937), Le Violon maudit (2000)
<br>\u00A9 éd. Gallimard Jeunesse.</small></div>
<br><div align=\"left\"><i><b>Extrait 4:</b> Complot à Rome</i><br>
<p style=\"margin-left:10px\">En cette funeste journée de mars, le soleil se coucha à son heure habituelle. Assis sur la vieille chaise de cuir, je tâchais de comprendre ce qui était arrivé, sans avoir encore conscience que le sang versé le matin même au sénat<sup>1</sup> allait tous nous éclabousser.
- Ils ont assassiné César. Jules César est mort! cria Membo en se précipitant dans la pièce, tel un cheval emballé.
Il était près de onze heures du matin. Porcia et moi lisions Hésiode<sup>2</sup> quand Membo fit irruption.
- Vingt-trois. Vingt-trois coups de poignard! continua l’affranchi<sup>3</sup>.</p></div>
<div align=\"right\"><small>Lola González, Complot à Rome (1995),<br>
 traduit de l’espagnol par Smahann Ben Nouna<br>
\u00A9 Castor Poche Flammarion.<br></div>
<div align=\"left\"><small><b>1.sénat:</b> assemblée politique.<br>
<b>2.Hésiode:</b> poète grec du VIIIe siècle avant Jésus-Christ.<br>
<b>3.affranchi:</b> ancien esclave (ici Membo).</div>"
            readOnly: true
            font.family: "Helvetica"
            font.pointSize: 12
            horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
            textFormat: TextEdit.RichText
        }
        Text{
            id:question_label
            visible: true
            text:"Dis quel roman commence par:"
            font.family: "Helvetica"
            font.pointSize: 12
            fontSizeMode: Text.Fit;
            minimumPointSize: 12;
        }
        GridLayout{
            id:questions_group
            visible: true
            columns: 4
            Layout.fillWidth: true
            Layout.fillHeight: true
            Text { text: "par la description d’un personnage:"; wrapMode: Text.WordWrap }
            TextField{id:q1;placeholderText:"extrait N°"}
            Text { text: "par un dialogue:";wrapMode: Text.WordWrap }
            TextField{id:q2;placeholderText:"extrait N°";}
            Text { text: "par une action:";wrapMode: Text.WordWrap }
            TextField{id:q3;placeholderText:"extrait N°"}
            Text { text: "par un commentaire du narrateur:";wrapMode: Text.WordWrap }
            TextField{id:q4;placeholderText:"extrait N°";}
        }

        Rectangle{
            color:"#e91e63"
            Layout.preferredHeight: text_temine.height+10
            Layout.preferredWidth: text_temine.width+10
            radius: 10
            Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
            }
            Text{
                id:text_temine
                text:"Exercice terminé"
                font.family: "Helvetica"
                font.pointSize: 16
                fontSizeMode: Text.Fit;
                minimumPointSize: 12;
                font.bold: true
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    exDifficileStateFrench.complete=true;
                    pushState();
                    root.enabled=false;
                }
            }

        }
    }
}

