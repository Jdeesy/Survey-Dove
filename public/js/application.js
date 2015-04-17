function validateLoginUser() {
  var username = document.forms["login_user"]["user[username]"].value
  console.log(username)
    if (username == null || username == ""){
      alert("Username must be filled");
      return false;
    };

  var password = document.forms["login_user"]["user[password]"].value
  console.log(password)
    if (password == null || password == ""){
      alert("Password must be filled");
      return false;
    };    
}

function validateCreateUser() {
  var first_name = document.forms["create_user"]["user[first_name]"].value
  console.log(first_name)
    if (first_name == null || first_name == ""){
      alert("First Name must be filled");
      return false;
    };

  var last_name = document.forms["create_user"]["user[last_name]"].value
  console.log(last_name)
    if (last_name == null || last_name == ""){
      alert("Last Name must be filled");
      return false;
    };

  var email = document.forms["create_user"]["user[email]"].value
  console.log(email)
    if (email == null || email == ""){
      alert("email must be filled");
      return false;
    };  

  var username = document.forms["create_user"]["user[username]"].value
  console.log(username)
    if (username == null || username == ""){
      alert("Username must be filled");
      return false;
    };

  var password = document.forms["create_user"]["user[password]"].value
  console.log(password)
    if (password == null || password == ""){
      alert("Password must be filled");
      return false;
    };   
}