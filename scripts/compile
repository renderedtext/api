var raml2obj = require('raml2obj');
var fs = require('fs');

raml2obj.parse("raml/api.raml").then((ramlObj) => {
  var json_output = JSON.stringify(ramlObj);
  fs.writeFile("json-output.json", json_output);
});
