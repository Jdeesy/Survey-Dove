$(document).ready(function(){
  $("form[name = add_choice]").on("submit", function(event){
    event.preventDefault();
    console.log(event),
    addChoice = $.ajax({
      url: $(this).attr("action"),
      type: "post",
      data: $(this).serialize(),
    });
    console.log($(this).serialize())

    addChoice.done(function(response){
      console.log("Done"),
      $(".choices").append(response)
      $("input[name = name]").val("")
    });
  });

  $("form[name = add_question]").on("submit",function(event){
      event.preventDefault();
      
      addQuestion = $.ajax({
        url: $(this).attr("action"),
        type: "post",
        data: $(this).serialize(),
      });
      // console.log($(this).attr("name"))
      // console.log($(event))

      addQuestion.done(function(response){
        
        
        $(".questions").append(response)
        $("input[name = prompt]").val("")
      });
    });


});