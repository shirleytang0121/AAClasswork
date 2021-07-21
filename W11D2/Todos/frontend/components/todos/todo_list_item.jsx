import React from 'react';

export default class TodoListItem extends React.Component{
  

    toggleDone=(e)=>{
        e.preventDefault();
       const newTodo=Object.assign({},this.props.todo)
       newTodo.done = !newTodo.done
       this.props.receiveTodo(newTodo)
    //    this.props.todo.done = !this.props.todo.done
    //    this.props.receiveTodo(this.props.todo)
    }

    handleDelete=(e)=>{
        e.preventDefault();
        this.props.removeTodo(this.props.todo);
    }

    render(){
        return(
            <li>
                <div>{this.props.todo.title} 
                    <button onClick={this.toggleDone}>{this.props.todo.done ? 'Undo':'Done' }</button>
                    <button onClick={this.handleDelete}>Delete Todo</button>
                </div>
            </li>
        )
    }
}