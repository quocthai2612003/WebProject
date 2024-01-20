$(document).ready(function(){
    //-- Click on QUANTITY
    $(".btn-minus").on("click",function(){
        var now = $(".quantity > div > input").val();
        if ($.isNumeric(now)){
            if (parseInt(now) -1 > 0){ now--;}
            $(".quantity > div > input").val(now);
        }else{
            $(".quantity > div > input").val("1");
        }
    })
    $(".btn-plus").on("click",function(){
        var now = $(".quantity > div > input").val();
        if ($.isNumeric(now)){
            $(".quantity > div > input").val(parseInt(now)+1);
        }else{
            $(".quantity > div > input").val("1");
        }
    })
})
// Slidershow
document.getElementById('next').onclick = function (){
    let lists  = document.querySelectorAll('.item');
    document.getElementById('slide').appendChild(lists[0]);
}
document.getElementById('prev').onclick = function (){
    let lists  = document.querySelectorAll('.item');
    document.getElementById('slide').prepend(lists[lists.length - 1]);
}