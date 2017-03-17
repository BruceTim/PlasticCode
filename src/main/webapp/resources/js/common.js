$("#head_menu").find("li").removeClass("cur");
if(query_string != '') {
  if(query_string[0] == "Products") {
  
    $("#headProducts").addClass("cur");
  }else if(query_string[0] == "Company" && query_string[1] == "Company") {
    $("#headAboutUs").addClass("cur");

  }else if(query_string[0] == "Company" && query_string[1] == "Factory") {
    $("#headFactorytour").addClass("cur");

  }else if(query_string[0] == "Company" && query_string[1] == "Quality") {
    $("#headQualityControl").addClass("cur");

  }else if(query_string[0] == "Company" && query_string[1] == "ContactUs") {
    $("#headContactUs").addClass("cur");

  }else{
    $("#headHome").addClass("cur");
  }
}else{
  $("#headHome").addClass("cur");
}