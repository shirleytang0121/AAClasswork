/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {

//overview


class FollowToggle {
   constructor(el) {
       this.$el = $(el)
       this.userId = this.$el.data("user-id")
       this.current_userId = this.$el.data("current-user-id")
       this.followState = this.$el.data("initial-follow-state") === "true" ? true : false;
       this.render();
        this.handleClick();
       console.log(`userid:${this.userId}`)
       console.log(`current:${this.current_userId}`)
    }

    // const $el = $(".follow-toggle")
    // console.log($el)
    render() {
        if(this.followState){
            this.$el.text('unfollow!');
        }else{
            this.$el.text('follow!');
        }
    }

    handleClick(){
        this.$el.on('click', e => {
            e.preventDefault();
            if(this.followState){
                $.ajax({
                    method:"delete",
                    url: `/users/${this.userId}/follow`,
                    data: {
                        follow: {
                            followee_id: this.current_userId,
                        }
                    },
                    dataType: 'JSON',
                }).then(res => console.log(res))
                  .fail(res => console.log(res));
                  this.followState = false;

            }else{
                $.ajax({
                    method:"post",
                    url: `/users/${this.userId}/follow`,
                    data: {
                        follow: {
                            followee_id: this.current_userId,
                        }
                    },
                    dataType: 'JSON',
                }).then(res => console.log(res))
                .fail(res => console.log(res))
                this.followState= true;

            }
        })
    }

}


module.exports = FollowToggle;

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
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

const jQueryStuff = () => {
    const $buttons = $(".follow-toggle")
    $buttons.each( (idx, el) => new FollowToggle(el) )

    //all code goes in here
}

$(jQueryStuff);
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map