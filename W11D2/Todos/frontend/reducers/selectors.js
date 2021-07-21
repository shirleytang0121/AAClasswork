export const allTodos = (state) => Object.values(state.todos);


export const stepsByTodoId = (state, todoId) => Object.values(state.steps).filter( (step)=> step.todo_id === todoId)



