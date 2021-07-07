const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;
const mo = new MovingObject({
    pos: [30, 30],
    vel: [10, 10],
    radius: 5,
    color: "#00FF00"
  });

document.addEventListener("DOMContentLoaded", function(){
    const screen = document.getElementById("game-canvas");
    const ctx = screen.getContext("2d");
      mo.draw(ctx);
      mo.move();
      
});
