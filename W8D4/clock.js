class Clock {
    constructor() {
      // 1. Create a Date object.
      this.date = new Date();
      // 2. Store the hours, minutes, and seconds.
      this.hours = this.date.getHours();
      this.minutes = this.date.getMinutes();
      this.seconds = this.date.getSeconds();
      // 3. Call printTime.
      this.printTime()
      // 4. Schedule the tick at 1 second intervals.
      setInterval(this._tick.bind(this),1000)
    }
  
    printTime() {
      // Format the time in HH:MM:SS
      let time = `${this.hours}:${this.minutes}:${this.seconds}`
      // Use console.log to print it.
      console.log(time)
    }
  
    _tick() {
      // 1. Increment the time by one second.
      if (this.seconds < 59) {
          this.seconds++;
      }else{
          this.seconds = 0;
          if (this.minutes < 59){
              this.minutes++;
          }else{
              this.minutes = 0;
              if (this.hours < 23){
                  this.hours++;
              }else{
                  this.hours = 0;
              }
          }
      }
      // 2. Call printTime.
      this.printTime()
    }
  }
  
  // const clock = new Clock();

  // console.log(clock)

// let a = new Date()
// console.log(a)
// console.log(a.getHours())



