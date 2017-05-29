let raml2obj = require('raml2obj');
let fs = require('fs');

raml2obj.parse("raml/api.raml").then((ramlObj) => {
  let json_output = JSON.stringify(ramlObj);
  fs.writeFile("json-output.json", json_output);
});
