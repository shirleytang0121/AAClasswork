import React from "react";
import StepListContainer from "../steps/step_list_container";

export default class TodoDetailView extends React.Component {
  handleDelete = (e) => {
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
  };

  render() {
    return (
      <div>
        <p>{this.props.todo.body}</p>
        <StepListContainer todoId={this.props.todo.id}/>
        <button onClick={this.handleDelete}>Delete Todo</button>
      </div>
    );
  }
}
