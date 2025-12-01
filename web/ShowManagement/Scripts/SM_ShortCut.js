                    function initSM_SKeys() {

                        shortcut.add("S", function() {
                           parent.document.getElementById("yourIframe").src = "SM_NewShow.jsp";
                        }, {
                            'type': 'keydown',
                            'disable_in_input': true,
                            'disable_select': true
                        });
                        
                          shortcut.add("SHIFT+S", function() {
                           
                           parent.document.getElementById("yourIframe").src = "SM_NewShow.jsp";
                           
                        }, {
                            'type': 'keydown',
                            'disable_in_input': true,
                            'disable_select': true
                        });




                        shortcut.add("E", function() {
                             parent.document.getElementById("yourIframe").src = "SM_Add_Show_Exhibitor.jsp";
                        }, {
                            'type': 'keydown',
                            'disable_in_input': true,
                            'disable_select': true
                        });
                        
                        shortcut.add("SHIFT+E", function() {
                             parent.document.getElementById("yourIframe").src = "SM_Add_Show_Exhibitor.jsp";
                        }, {
                            'type': 'keydown',
                            'disable_in_input': true,
                            'disable_select': true
                        });







/*

                        shortcut.add("C", function() {
                             parent.document.getElementById("yourIframe").src = "SM_Placements.jsp";
                        }, {
                            'type': 'keydown',
                            'disable_in_input': true,
                            'disable_select': true
                        });
                        
                        
                         shortcut.add("SHIFT+C", function() {
                             parent.document.getElementById("yourIframe").src = "SM_Placements.jsp";
                        }, {
                            'type': 'keydown',
                            'disable_in_input': true,
                            'disable_select': true
                           
                        });
    */                    
                        
                        shortcut.add("ALT+S", function() {
                            if (document.forms[0].name == 'SM_Add_Show_Exhibitor')
                                submitForm(document.forms[0]);
                        }, {
                            'type': 'keydown'
                        });
                        
                        
                         shortcut.add("ALT+N", function() {
                            if(document.forms[0].name=='SM_Add_Show_Exhibitor')
                                AddNewExhibitor();
                        }, {
                            'type': 'keydown'
                        });
                        
                        
                        shortcut.add("ALT+E", function() {
                            Search_Exhibitor();
                        }, {
                            'type': 'keydown'
                                                       
                        });
                    }