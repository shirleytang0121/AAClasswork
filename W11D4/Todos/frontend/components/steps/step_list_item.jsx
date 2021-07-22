import React from "react";


export default class StepListItem extends React.Component{
    toggleDone = (e) => {
        e.preventDefault();
        const newStep = Object.assign({}, this.props.step);
        newStep.done = !newStep.done;
        this.props.receiveStep(newStep);
      };

      handleDelete = (e) => {
        e.preventDefault();
        this.props.removeStep(this.props.step);
      };
    

    render(){
        return(
            <div>
                <p>{this.props.step.title}</p>
                <p>{this.props.step.body}</p>
                <button onClick={this.toggleDone}>
                    {this.props.step.done ? "Undo" : "Done"}
                </button>
                <button onClick={this.handleDelete}>Delete Step</button>
            </div>
        )
    }
}