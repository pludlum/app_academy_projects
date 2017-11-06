/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);

window.$l = function (arg) {
  if (typeof arg === "string") {
    const NodeList = document.querySelectorAll(arg);
    return Array.from(NodeList);
  } else if (arg instanceof HTMLElement) {
    return new DOMNodeCollection([arg]);
  }
};


/***/ }),
/* 1 */
/***/ (function(module, exports) {

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


/***/ })
/******/ ]);