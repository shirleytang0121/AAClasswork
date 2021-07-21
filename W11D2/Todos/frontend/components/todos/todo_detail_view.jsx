import React from "react";

export default class TodoDetailView extends React.Component {
  handleDelete = (e) => {
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
  };

  render() {
    return (
      <div>
        <p>{this.props.todo.body}</p>
        <button onClick={this.handleDelete}>Delete Todo</button>
      </div>
    );
  }
}
