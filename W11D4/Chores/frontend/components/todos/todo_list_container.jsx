import { connect } from "react-redux";
import TodoList from "./todo_list";
import { createTodo, fetchAllTodos, receiveTodo, removeTodo } from "../../actions/todo_actions";
import { allTodos } from "../../reducers/selectors";

const mapStateToProps = (state) => ({
  todos: allTodos(state)
})

const mapDispatchToProps = dispatch => ({
  receiveTodo: todo => dispatch(receiveTodo(todo)),
  removeTodo: todo => dispatch(removeTodo(todo)),
  fetchAllTodos: todos => dispatch(fetchAllTodos(todos)),
  createTodo: todo => dispatch(createTodo(todo))
});

const TodoListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

export default TodoListContainer;
