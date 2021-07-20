import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { receiveTodo, receiveTodos, removeTodo } from './actions/todo_actions';
import { receiveStep, receiveSteps, removeStep } from './actions/step_actions';

function Root() {
  return (
    <h1>Todos App</h1>
  );
};

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root />, root);

  const store = configureStore();
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.removeTodo = removeTodo;
  window.receiveStep = receiveStep;
  window.receiveSteps = receiveSteps;
  window.removeStep = removeStep;
});
