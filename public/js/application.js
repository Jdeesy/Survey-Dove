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
  });

});