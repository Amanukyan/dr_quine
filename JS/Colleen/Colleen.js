/*
 ** This program prints a copy of its own source code
 */

function print_self() {
  console.log(
    "/*\n ** This program prints a copy of its own source code\n */\n\n" +
      print_self.toString() +
      "\n\n" +
      main.toString() +
      "\n\nmain();"
  );
}

function main() {
  /*
   ** Print Self
   */
  print_self();
}

main();
