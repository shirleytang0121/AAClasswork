import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

export default class TodoList extends React.Component {
  componentDidMount() {
    this.props.fetchAllTodos();
  }

  render() {
    return(
      <div className='todo-list'>
        <TodoForm receiveTodo={this.props.receiveTodo} createTodo={this.props.createTodo}/>
        <ul className='todo-list-items'>
          {this.props.todos.map((todo)=>
            <TodoListItem key={todo.id} todo={todo} receiveTodo={this.props.receiveTodo} removeTodo={this.props.removeTodo}/>)}
        </ul>
      </div>
    )
  };
};
