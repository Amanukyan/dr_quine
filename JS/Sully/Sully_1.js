const fs = require('fs');
const { execSync } = require('child_process');

var i = 1;

(function sully() {
  if (i <= 0) return 0;
  if (fs.existsSync("Sully_" + i + ".js")) i--;
  fs.writeFileSync(
    "Sully_" + i + ".js",
    "const fs = require('fs');\nconst { execSync } = require('child_process');\n\nvar i = " +
      i +
      ";\n\n(" +
      sully.toString() +
      ")();\n"
  );
  execSync("node Sully_" + i + ".js");
})();
