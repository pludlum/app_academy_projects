class DOMNodeCollection {
  constructor(els) {
    this.els = els;
  }

  each(callback) {
    this.els.forEach(callback);
  }

  html(str) {
    if (str === undefined) {
      return this.el[0].innerHTML;
    } else {
      this.each(function (node) {node.innerHTML = str;});
    }
  }

  empty() {
    this.each(function (node) {node.innerHTML = "";});
  }

  append(str) {
    this.each(function (node) {node.innerHTML += str;});
  }

  attr(attName, value) {
    if (value === undefined) {
      return this.els[0].getAttribute(attName);
    } else {
      this.els[0].setAttribute(attName, value);
      return value;
    }
  }

  removeClass() {
    this.els[0].removeAttribute('class');
  }

  addClass(className) {
    this.attr("class", className);
  }

  children() {
    let children = [];
    this.each((node) => {
      children = children.concat(Array.from(node.children));
    });
    return new DOMNodeCollection(children);
  }

  parent() {
    let parents = [];
    this.each((node) => {
      parents.push(node.parentElement);
    });
    return new DOMNodeCollection(parents);
  }

  find(selectorStr) {
    let foundNodes = [];
    this.each((node) => {
      foundNodes = foundNodes.concat(Array.from(node.querySelectorAll(selectorStr)));
    });
    return new DOMNodeCollection(foundNodes);
  }

  remove() {
    this.empty();
    this.els = [];
  }

}



module.exports = DOMNodeCollection;
