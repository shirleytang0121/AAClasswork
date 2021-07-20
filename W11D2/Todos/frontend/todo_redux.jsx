import React from 'react';
import ReactDOM from 'react-dom';

function Root() {
  return (
    <h1>Todos App</h1>
  );
};

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root />, root);
});
