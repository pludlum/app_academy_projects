const Cat = function(name, owner) {
  this.name = name;
  this.owner = owner;

};

Cat.prototype.cuteStatment = function () {
  return `Everyone loves ${this.owner}!`;
};

Cat.prototype.meow = function() {
  return 'Meow';
};

let cat = new Cat("Speghatto", "Giuseppe");
let cat2 = new Cat("Dog Dog", "Giuseppe");

cat.meow = function() {
  return 'Me-yow';
};

console.log(cat.meow());
console.log(cat2.meow());
