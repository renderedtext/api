const parser = require("raml-1-parser");
const path   = require("path");

function parse() {
  return parser.loadApiSync(path.resolve(__dirname, "api.raml"));
}

const spec = parse();

console.log(spec)
