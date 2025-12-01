/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function SelectRow(RowID,varCategory,varGender,AgeFrom,AgeTO,Rider,Name)
{
        
    opener.document.forms[0].Category.value = varCategory
    if(varCategory=='PasoFino' || varCategory=='Performance' || varCategory=='Pleasure')
        opener.document.forms[0].Air.value = 'PasoFino'
     else if(varCategory=='Equitation')
        opener.document.forms[0].Air.value =''
    else
        opener.document.forms[0].Air.value = varCategory

    opener.document.forms[0].Gender.value = varGender
    opener.document.forms[0].AgeFrom.value = AgeFrom
    opener.document.forms[0].AgeTo.value = AgeTO
    opener.document.forms[0].Rider.value = Rider
    opener.document.forms[0].EventName.value = Name
    opener.document.forms[0].DontChange.value ="Y"
   
    window.close();

}
