const abc = 'abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789'.split("");
let res = "";

const amount = process.argv[2] || 50;

for(let i = 0; i < amount; i++) {
	res += abc[parseInt(Math.random()*abc.length)];
}

console.log(res);
