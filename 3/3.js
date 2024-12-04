const fs = require('node:fs');

fs.readFile('input', 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    return;
  }

  var sum = 0;
  var regex = /mul\(\d+,\d+\)/gm;
  var matches = data.match(regex);
  matches.forEach((item) => {
    const e = item.match(/\d+/g);
    sum += Number(e[0]) * Number(e[1]);     
  });

  console.log(sum);


   var x = data.replace(/(don't\(\))(.*?)(do\(\))/gms, '');

   console.log(x);
   regex = /mul\(\d+,\d+\)/gm;
   matches = x.match(regex);
   sum = 0;
   matches.forEach((item) => {
    const e = item.match(/\d+/gm);
    //console.log(e)
    sum += Number(e[0]) * Number(e[1]);     
  });
   console.log(sum);

});


