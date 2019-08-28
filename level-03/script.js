// This is a closure function https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-closure-b2f0d2152b36
(function() {
    let name = document.getElementById('name');
    let phoneno = document.getElementById('phoneno');
    let email = document.getElementById('email');
    let dept_primary = document.getElementById('dept_primary');
    let dept_secondary = document.getElementById('dept_secondary');
    let submit = document.getElementById('button');
    let special_charaters = /[ !#$%^&*()_+\-=\[\]{};':"\\|,<>\/?]/;
  var initialize = function() {
    /*
      1. Add all your event bindings here. Please avoid binding events inline and add your event listeners here.

      onSubmit callback
      disableDuplicateSecondaryDepartment callback,...
    */
    dept_primary.addEventListener("change",disableDuplicateSecondaryDepartment);
    submit.addEventListener("click",onSubmit,false);

  };

  var disableDuplicateSecondaryDepartment = function(event) {
    // 2. in department2, Should disable the option selected in department1
    for(var i=0;i<dept2_field.length;i+=1)
    {
      if(dept_secondary[i].value===dept_primary.value)
        {
          dept_secondary[i].disabled=true;
        }
      else
        {
          dept_secondary[i].disabled=false;
        }
    }
  }

  var constructData = function() {
    var data = {};
    data[name.name] = name.value;
    data[phoneno.name] =phoneno.value;
    data[email.name] = email.value;
    data[dept_primary.name] = dept_primary.value;
    data[dept_secondary.name] = dept_secondary.value;
    // 3. Construct data from the form here. Please ensure that the keys are the names of input elements

    return data;
  }

  var validateResults = function(data) {
    var isValid = true;
     if(data.name.length > 100)
      {
      	isValid = false;
      }else if(data.phno.length > 10)
      {
      	isValid = false;
      }else if((!data[email.name].endsWith('@college.edu')))
      {
      	isValid = false;
      }
      else if(special_charaters.test(data[email.name]))
      {
      	isValid = false; 
      }else if(data[dept_primary.name] == data[dept_secondary.name])
      {
      	isValid = false;
      }
    // 4. Check if the data passes all the validations here

    return isValid;
  };

  var onSubmit = function(event) {
    // 5. Figure out how to avoid the redirection on form submit

    event.preventDefault();
    var data = constructData();

    //console.log(data);

    if (validateResults(data)) {
      printResults(data);
    } 
    else {
      var resultsDiv = document.getElementById("results");
      resultsDiv.innerHTML = '';
      resultsDiv.classList.add("hide");
    }
  };

  var printResults = function(data) {
    var constructElement = function([key, value]) {
      return `<p class='result-item'>${key}: ${value}</p>`;
    };

    var resultHtml = (Object.entries(data) || []).reduce(function(innerHtml, keyValuePair) {
      debugger
      return innerHtml + constructElement(keyValuePair);
    }, '');
    var resultsDiv = document.getElementById("results");
    resultsDiv.innerHTML = resultHtml;
    resultsDiv.classList.remove("hide");
  };

  /*
    Initialize the javascript functions only after the html DOM content has loaded.
    This is to ensure that the elements are present in the DOM before binding any event listeners to them.
  */
  document.addEventListener('DOMContentLoaded', initialize);
})();
