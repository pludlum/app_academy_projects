const DOMNodeCollection = require("./dom_node_collection");

window.$l = function (arg) {
  if (typeof arg === "string") {
    const NodeList = document.querySelectorAll(arg);
    return Array.from(NodeList);
  } else if (arg instanceof HTMLElement) {
    return new DOMNodeCollection([arg]);
  }
};
