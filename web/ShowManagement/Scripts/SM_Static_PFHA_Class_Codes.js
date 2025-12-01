$.widget( "custom.catcomplete", $.ui.autocomplete, {
    _create: function() {
      this._super();
      this.widget().menu( "option", "items", "> :not(.ui-autocomplete-category)" );
    },
    _renderMenu: function( ul, items ) {
      var that = this,
        currentCategory = "";
      $.each( items, function( index, item ) {
        var li;
        if ( item.category != currentCategory ) {
          ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" );
          currentCategory = item.category;
        }
        li = that._renderItemData( ul, item );
        if ( item.category ) {
           li.attr( "aria-label", item.code + " : " + item.code );
        }
      });
      
    }
  });
  
  var bExecute='Y';
  data='';

function getData() {
var data1;
    $.ajax({
        async: false, //thats the trick
        url: 'SM_PFHA_Static_Class_Codes.jsp',
        dataType: 'json',
         cache : false,
        success: function(response){
          data1 = response;
        }
    });
    return data1;
}

 function GetEventData(InpObj,CodeObj,Gen_Open_Obj,Gen_Sta_Obj,Gen_mare_Obj,Gen_Gen_Obj,ageFrom_Obj,ageTo_Obj){
   
  bKeyBoard='N' 
  if(bExecute==='Y')
     data=getData()
  
  bExecute='N' ;
  
   $(InpObj).catcomplete({
      delay: 0,
      source: data,
      select: function( event, ui ) {
          
           Gen_Open_Obj.checked=false;
           Gen_Gen_Obj.checked=false;
           Gen_Sta_Obj.checked=false;
           Gen_mare_Obj.checked=false;
           
            CodeObj.value=ui.item.code
            var ObjGender=ui.item.gender
            var ObjGender_=ObjGender.split(",")
                     
            for(var i=0;i<ObjGender_.length;i++){
                 if(ObjGender_[i]==='O'){
                    Gen_Open_Obj.checked=true
                    break;
                }
            }
            
            for(var j=0;j<ObjGender_.length;j++){
                 if(ObjGender_[j]==='G'){
                    Gen_Gen_Obj.checked=true
                    break;
                }
            }
            
            for(var k=0;k<ObjGender_.length;k++){
                 if(ObjGender_[k]==='S'){
                    Gen_Sta_Obj.checked=true
                    break;
                }
            }
            
            for(var l=0;l<ObjGender_.length;l++){
                 if(ObjGender_[l]==='F'){
                    Gen_mare_Obj.checked=true
                    break;
                }
            }
            
            ageFrom_Obj.value=ui.item.ageFrom
            ageTo_Obj.value=ui.item.ageTo
            
            bKeyBoard='Y';
          }
    });
   }
  function CopyDate_Fee_Values(RowIndex,DateObj,FeeObj,PointedChkObj){
     
   
     var DateValue='';
     var FeeValue=$(Sh_Std_Fee).val();
     
      if(RowIndex===0)
        DateValue= $(fromDate).val();
     else {
             DateValue= $("#txtDate"+RowIndex).val();
        }
    
    if(DateObj.value===''){
        if(DateValue!==undefined)
            DateObj.value=DateValue;
     PointedChkObj.checked=true;  
   }

     if(FeeObj.value==='')
        FeeObj.value=FeeValue;


  }
  
  
  
  function Class_AutoSave(obj,CurrentRow){
     var $form = $(obj).closest('form'); // OR var form = obj.from;
        var dataString = $form.serialize();
        

       
      $.ajax({
            type: "POST",
            url: "SM_EventsList_Save.jsp?Row="+CurrentRow,
            data: dataString, // serializes the form's elements.
             success: function (data) {
                 document.getElementById("txtEventSeq"+CurrentRow).value=data.trim();
              
                //alert(data.trim());
            },
            error: function (data) {
               // alert('An error occurred.');
                //alertlog(data);
            }
        });
  }
  
  