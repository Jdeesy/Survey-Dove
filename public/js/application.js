$(document).ready(function(){

  $("form[name=add_question]").on("submit",function(event){
    event.preventDefault();
    
    addQuestion = $.ajax({
      url: $(this).attr("action"),
      type: "post",
      data: $(this).serialize(),
    });

    addQuestion.done(function(response){
      $(".questions").append(response);
      // $("input[name=\"question[prompt]]\"").val("");
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
      choices.append(response);
      // $("input[name=\"choice[name]]\"").val("");
    });
  });

});