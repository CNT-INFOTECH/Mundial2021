/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function Update_Participants()
{
        document.forms[0].method="post";
        document.forms[0].action="servlet/Shows"
        document.forms[0].submit();
}
  function JQueryClose_Participants()
    {

        window.parent.jQuery('#Participant_Details').dialog('close');


    }