$(document).ready(function(){

  $(document).on("submit", "form[name=add_question]", function(event){
    event.preventDefault();
    
    addQuestion = $.ajax({
      url: $(this).attr("action"),
      type: "post",
      data: $(this).serialize(),
    });

    addQuestion.done(function(response){
      $(response).hide().appendTo(".questions").slideDown("slow");
    });
    
    $(this).find('input[type=\"text\"]').val("");
  });

  $(document).on("submit", "form[name=add_choice]", function(event){
    event.preventDefault();
    var choices = $(this).parent().find(".choices ul");

    addChoice = $.ajax({
      url: $(this).attr("action"),
      type: "post",
      data: $(this).serialize(),
    });

    addChoice.done(function(response){
      $(response).hide().appendTo(choices).slideDown("fast");
    });

    $(this).find('input[type=\"text\"]').val("");
  });

});

function validateCreateUser() {
  var name = document.forms["create_user"]["name"].value
  // console.log(name)
  if (name == null || name == ""){
    // event.preventDefault();
    // $("td.full_name").replace("<td>First Name must be filled</td>")
    alert("First Name must be filled");
    return false;
  };

  var email = document.forms["create_user"]["email"].value
  // console.log(email)
  if (email == null || email == ""){
    // event.preventDefault();
    alert("email must be filled");
    return false;
  };  

  var password = document.forms["create_user"]["password"].value
  // console.log(password)
  if (password == null || password == ""){
    alert("Password must be filled");
    return false;
  }
  else if (password.length < 8){
    alert("Password must be at least 8 characters long");
    return false;
  };   
}