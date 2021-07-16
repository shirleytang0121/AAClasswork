import React from "react";

class Clock extends React.Component{
    constructor(props){
        super(props);

        var date = new Date(),
        time = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds()

        this.state={
            time: time
        }
        this.tick = this.tick.bind(this);

    }

    tick(){
        var date = new Date(),
            time = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds()

        this.setState({
            time: time,
        })
    }

    componentDidMount(){
        this.interval = setInterval(this.tick, 1000)
    }

    // componentWillUnmount(){
    //     clearInterval(this.interval)
    // }

    render(){
        return (<div>
            <h1 class="header"> Clock </h1>
            <div class="clock">{this.state.time}</div></div>)
    }
}

export default Clock