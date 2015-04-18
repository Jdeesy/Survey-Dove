$(document).ready(function(){
  $("form[name = add_choice]").submit(function(event){
    event.preventDefault();

    addChoice = $.ajax({
      url: $(this).attr("action"),
      type: "post",
      data: $(this).serialize()
    });

    addChoice.done(function(response){
      console.log("Done"),
      $(".choices").append(response)
      $("input[name = name]").val("")
    });
  });

  $("form[name = add_question]").submit(function(event){
      event.preventDefault();
console.log($(this).serialize()),
      addQuestion = $.ajax({
        
        url: $(this).attr("action"),
        type: "post",
        data: $(this).serialize()
      });

      addQuestion.done(function(response){
        console.log("Done"),
        $(".questions").append(response)
        $("input[name = name]").val("")
      });
    });


});