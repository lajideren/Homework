/**
 * Created by wangty.
 */

// $(function () {
//     $(".selecter>ul>li>ul.nor>li").click(function () {
//         $($(this).parent().children()).removeClass("activeXiang");
//         $(this).addClass("activeXiang");
//     })
// })

function changeBox(sort, grade, subject) {
    $("#s>ul.nor").children().removeClass("activeXiang");
    $("#"+sort).addClass("activeXiang");

    var gradeBox = sort + "0";
    var subBox = sort + "" + grade + "0";

    $("#"+gradeBox).css("display", "block");

    if(grade!==0){
        $("#g>ul.nor").children().removeClass("activeXiang");
        $("#"+sort+""+grade).addClass("activeXiang");

        $("#"+subBox).css("display", "block");
    }
    if(subject!==0){
        $("#sub>ul.nor").children().removeClass("activeXiang");
        $("#"+sort+""+grade+""+subject).addClass("activeXiang");
    }

}