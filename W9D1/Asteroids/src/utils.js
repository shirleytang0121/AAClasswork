// utility code, vector math and what have you
const Util = {
    inherits(childClass, parentClass) {
      function Surrogate(){};
      Surrogate.prototype = parentClass.prototype;
      childClass.prototype = new Surrogate();
      childClass.prototype.constructor = childClass;
    }
  };
  
  module.exports = Util;
