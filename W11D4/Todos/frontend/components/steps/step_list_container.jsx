import { connect } from "react-redux";
import { receiveStep } from "../../actions/step_actions";
import { stepsByTodoId } from "../../reducers/selectors";
import StepList from "./step_list";

const mapDispatchToProps = (dispatch) =>({
    receiveStep: step => dispatch(receiveStep(step))
})

const mapStateToProps = (state, {todoId}) =>({
    steps: stepsByTodoId(state, todoId),
    todo_id: todoId
})

const StepListContainer = connect(mapStateToProps,mapDispatchToProps)(StepList);

export default StepListContainer;