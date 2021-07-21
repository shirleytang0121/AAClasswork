import React from "react";
import TodoDetailViewContainer from "./todo_detail_view_container";

export default class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      detail: false
    }
    this.handleShow = this.handleShow.bind(this);
  }

  toggleDone = (e) => {
    e.preventDefault();
    const newTodo = Object.assign({}, this.props.todo);
    newTodo.done = !newTodo.done;
    this.props.receiveTodo(newTodo);
  };

  handleShow(e) {
    this.setState({detail: !this.state.detail})
  }

  render() {
    return (
      <li>
        <div>
          <div onClick={this.handleShow}>{this.props.todo.title}</div>
          <button onClick={this.toggleDone}>
            {this.props.todo.done ? "Undo" : "Done"}
          </button>
          {this.state.detail ? <TodoDetailViewContainer todo={this.props.todo} /> : null}
        </div>
      </li>
    );
  }
}
