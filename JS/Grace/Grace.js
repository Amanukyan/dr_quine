/*
 ** This program writes a copy of its own source code in a file
 */

const fs = require('fs');

const fileName = 'Grace_kid.js';
const errorPrefix = 'Error ';
const errorWrittingFile = 'writting in file: ';

(function grace() {
  fs.writeFile(
    fileName,
    "/*\n ** This program writes a copy of its own source code in a file\n */\n\nconst fs = require('fs');\n\nconst fileName = 'Grace_kid.js';\nconst errorPrefix = 'Error ';\nconst errorWrittingFile = 'writting in file: ';\n\n(" +
      grace.toString() +
      ")();\n",
    function(err) {
      if (err) {
        return console.log(errorPrefix + errorWrittingFile + err);
      }
    }
  );
})();
