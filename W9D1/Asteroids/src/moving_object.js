// base class for anything that moves


function MovingObject(options) {
    //  debugger
    this.pos = options.pos; // 2d array x,y
    this.vel = options.vel; 
    this.radius = options.radius;
    this.color = options.color;

}
// MovingObject.prototype.move
MovingObject.prototype.move = function(){
    this.pos = [this.pos[0]+this.vel[0], this.pos[1]+this.vel[1]];
    
}


// MovingObject.prototype.draw(ctx)
MovingObject.prototype.draw = function(ctx){
   
    ctx.beginPath();
    ctx.fillStyle = this.color; 
    ctx.arc(this.pos[0],this.pos[1], this.radius, 0, 2*Math.PI, false);
    ctx.fill();

}

// MovingObject.prototype.isCollidedWith(otherMovingObject)
MovingObject.prototype.collideWith = function(otherObject) {

};

module.exports = MovingObject;