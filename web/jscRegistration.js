function Save()
{
                document.forms[0].method="post";
		document.forms[0].action="RegistrationServlet";
		document.forms[0].target="_self";
		document.forms[0].submit();
}
function Reset()
{
        document.forms[0].method="post";
        document.forms[0].action="frmBiopsyReport.jsp";
        document.forms[0].target="_self";
        document.forms[0].submit();
}


function ClosePage()
{
    var bOK = confirm("Do You Wish to Exit?");
    if (bOK)
    {
        document.forms[0].target="_self";
        document.forms[0].method="post";
        document.forms[0].action="empty.jsp";
        document.forms[0].submit();
    }
}

