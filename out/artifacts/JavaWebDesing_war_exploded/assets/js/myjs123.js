
    var ajax1 = function (shopid){
    var ajaxa = new XMLHttpRequest();
    console.log(shopid);
    var url = "AddOnCarServlet?shopid="+shopid;
    ajaxa.open("GET",url,true);
    ajaxa.send();
    ajaxa.onreadystatechange = function (){
    if (ajaxa.readyState == 4 && ajaxa.status == 200)
{
    alert(ajaxa.responseText);
    var ajaxa1 = new XMLHttpRequest();
    console.log("test");
    var url = "ShopingCarServlet";
    ajaxa1.open("GET",url,true);
    ajaxa1.send();
    ajaxa1.onreadystatechange = function (){
    if (ajaxa.readyState == 4 && ajaxa.status == 200)
{
    location.reload();
}
}
}
}
}

    var ajax2 = function (shopid){
    var ajaxa = new XMLHttpRequest();
    var url = "DeletCarShopServlet?shopid="+shopid;
    ajaxa.open("GET",url,true);
    ajaxa.send();
    ajaxa.onreadystatechange = function (){
    if (ajaxa.readyState == 4 && ajaxa.status == 200)
{
    location.reload();
    var ajaxa1 = new XMLHttpRequest();
    console.log("test");
    var url = "ShopingCarServlet";
    ajaxa1.open("GET",url,true);
    ajaxa1.send();
    ajaxa1.onreadystatechange = function (){
    if (ajaxa.readyState == 4 && ajaxa.status == 200)
{
    location.reload();
}
}
}
}
}