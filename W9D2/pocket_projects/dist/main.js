/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"Clock\": () => (/* binding */ Clock)\n/* harmony export */ });\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n\n\n\nclass Clock {\n   \n    constructor() {\n      // 1. Create a Date object.\n      console.log('hello');\n      const currentTime = new Date();\n  \n      // 2. Store the hour, minute, and second.\n      this.hours = currentTime.getHours();\n      this.minutes = currentTime.getMinutes();\n      this.seconds = currentTime.getSeconds();\n  \n      // 3. Call printTime.\n      (0,_warmup__WEBPACK_IMPORTED_MODULE_0__.htmlGenerator)(this.printTime(),clockElement);\n  \n      // 4. Schedule the tick at 1 second intervals.\n      setInterval(this._tick.bind(this), 1000);\n    }\n\n\n  \n    printTime() {\n      // Format the time in HH:MM:SS\n      const timeString = [this.hours, this.minutes, this.seconds].join(\":\");\n  \n      // Use console.log to print it.\n    //   console.log(timeString);\n        return timeString;\n    }\n  \n    _tick() {\n      // 1. Increment the time by one second.\n      this._incrementSeconds();\n  \n      // 2. Call printTime.\n      (0,_warmup__WEBPACK_IMPORTED_MODULE_0__.htmlGenerator)(this.printTime(),clockElement);\n    }\n  \n    _incrementSeconds() {\n      // 1. Increment the time by one second.\n      this.seconds += 1;\n      if (this.seconds === 60) {\n        this.seconds = 0;\n        this._incrementMinutes();\n      }\n    }\n  \n    _incrementMinutes() {\n      this.minutes += 1;\n      if (this.minutes === 60) {\n        this.minutes = 0;\n        this._incrementHours();\n      }\n    }\n  \n    _incrementHours() {\n      this.hours = (this.hours + 1) % 24;\n    }\n  }\n  \n\nconst clockElement = document.getElementById('clock');\nconst clock = new Clock();\n\n \n  \n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"attachDogLinks\": () => (/* binding */ attachDogLinks)\n/* harmony export */ });\n\nconst dogs = {\n  \"Corgi\": \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nconst dogList = document.querySelector('.drop-down-dog-list')\n\nconst dogLinkCreator = () => {\n  const dogLinks = []\n  \n  for (let dog in dogs) {\n    const atag = document.createElement('a');\n    atag.setAttribute('href', `${dogs[dog]}`);\n    atag.setAttribute('target', `_blank`);\n    atag.innerHTML = dog;\n    const litag = document.createElement('li');\n    litag.classList.add('dog-link');\n    litag.appendChild(atag);\n\n    dogLinks.push(litag);\n  }\n\n  return dogLinks\n}\n\nconst attachDogLinks = () => {\n  const dogLinks = dogLinkCreator()\n\n  dogLinks.forEach(dogLink => {\n    dogList.appendChild(dogLink);\n  });\n}\n\nconst handleEnter = (e) => {\n  console.dir(e.target)\n  e.target.children[1].style.display = 'block';\n};\n\nconst handleLeave = (e) => {\n  e.target.children[1].style.display = 'none';\n};\n\nattachDogLinks();\n\nconst dogsNav = document.querySelector('.drop-down-dog-nav')\ndogsNav.addEventListener('mouseenter', handleEnter);\ndogsNav.addEventListener('mouseleave', handleLeave);\n\n\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down */ \"./src/drop_down.js\");\n\n\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"htmlGenerator\": () => (/* binding */ htmlGenerator)\n/* harmony export */ });\n\nconst partyHeader = document.getElementById('party');\n\nconst htmlGenerator = (string, htmlElement) => {\n    if(Array.from(htmlElement.children).length > 0){\n        htmlElement.removeChild(htmlElement.firstChild);\n    }\n    const ptag = document.createElement('p');\n    const text = document.createTextNode(string);\n    ptag.appendChild(text);\n    htmlElement.appendChild(ptag);\n\n};\n\nhtmlGenerator('Party Time.', partyHeader);\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;