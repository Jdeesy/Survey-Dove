$(document).ready(function(){

  $("form[name=add_question]").on("submit",function(event){
    event.preventDefault();
    
    addQuestion = $.ajax({
      url: $(this).attr("action"),
      type: "post",
      data: $(this).serialize(),
    });

    addQuestion.done(function(response){
      $(response).hide().appendTo(".questions").slideDown("slow");
    });
  });

  $("form[name=add_choice]").on("submit", function(event){
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
  });

});