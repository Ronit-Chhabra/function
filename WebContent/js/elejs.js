function doentxt1(ref) {
    if (fan.checked == true)
        ref.disabled = false;
    else
        ref.disabled = true;
}

function doentxt2(ref) {
    if (AC.checked == true) {
        ref.disabled = false;
    } else
        ref.disabled = true;
}

function docalbill() 
{
   document.getElementById("txtlb").value=parseFloat(document.getElementById("txtl").value)*100;
   document.getElementById("txtub").value=parseFloat(document.getElementById("txtu").value)*4;
    if(fan.checked==true)
        {
            document.getElementById("txtfb").value=parseFloat(document.getElementById("txtf").value)*2;
        }
    else
        document.getElementById("txtfb").value=0;
     if(AC.checked==true)
        {
            document.getElementById("txtab").value=parseFloat(document.getElementById("txta").value)*2;
        }
    else
        document.getElementById("txtab").value=0;
    document.getElementById("txttb").value=parseFloat(document.getElementById("txtlb").value)+parseFloat(document.getElementById("txtub").value)+parseFloat(document.getElementById("txtfb").value)+parseFloat(document.getElementById("txtab").value);
    if (radc.checked == true) {
        document.getElementById("txtdb").value=parseFloat(document.getElementById("txttb").value)*20/100;
    }
    if (radd.checked == true) {
        document.getElementById("txtdb").value=parseFloat(document.getElementById("txttb").value)*10/100;
    }
    if(radc.checked==false && radd.checked==false)
        {
            document.getElementById("txtdb").value=0;
        }
    document.getElementById("txtnb").value=document.getElementById("txttb").value-document.getElementById("txtdb").value;
}