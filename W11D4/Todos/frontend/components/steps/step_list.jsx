import React from 'react';
import StepListItemContainer from './step_list_item_container';
import StepForm from './step_form';

export default class StepList extends React.Component{
    render(){
        return(
            <ul>
                {this.props.steps.map((step) =>  <StepListItemContainer key={step.id} step={step}/>)}  
                <StepForm todo_id={this.props.todo_id} receiveStep={this.props.receiveStep}/>     
            </ul>
        )
    }
}