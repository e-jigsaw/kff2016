const {readFileSync} = require('fs')

const txt = readFileSync('./supporters.txt').toString().replace(/\n/g, '、')
console.log(txt)
