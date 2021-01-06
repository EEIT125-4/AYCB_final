var isShow = false;
var brandname = document.getElementById("brandname");
var producttype = document.getElementById("producttype");
var productname = document.getElementById("productname");
var productseries = document.getElementById("productseries");
var productcategory = document.getElementById("productcategory");
var productprice = document.getElementById("productprice");
var productimage = document.getElementById("productimage");

function addshow() {
    if (!isShow) {
        isShow = true;
        document.getElementById('add').style.display = 'block';
    } else {
        isShow = false;
        document.getElementById('add').style.display = 'none';
    }
}

document.getElementById("databtn").addEventListener("click", function(){
    brandname.value = "Biotherm";
    producttype.value = "保養品";
    productname.value = "海洋深層水精油保溼噴霧";
    productseries.value = "海洋系列";
    productcategory.value = "精華液";
    productprice.value = "1230";
})

$('#addform').validator().on('submit', function(e) {
if (e.isDefaultPrevented()) { // 未驗證通過 則不處理
return;
} else { // 通过后，送出表单
alert("產品新增成功");
return "/Mpadd";
}
e.preventDefault(); // 防止原始 form 提交表单
});