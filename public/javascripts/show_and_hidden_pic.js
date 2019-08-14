function showPic(sUrl){
var x,y;
x = event.clientX;
y = event.clientY;
document.getElementById("ori_image").innerHTML = "<img src=\"" + sUrl + "\" border='1'>";
document.getElementById("ori_image").style.display = "block";
}
function hiddenPic(){
document.getElementById("ori_image").innerHTML = "";
document.getElementById("ori_image").style.display = "none";
}//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
