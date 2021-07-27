import React from 'react';
import { uniqueId } from '../../util/utils';

export default class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      id: uniqueId(),
      title: '',
      body: '',
      done: false
    }
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateTitle(e) {
    this.setState({title: e.target.value});
  }

  updateBody(e) {
    this.setState({body: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    // this.props.createTodo(this.state);
    this.props.createTodo(this.state).then(
      () => this.setState({title: '', body: ''})
    );
    this.setState({
      id: uniqueId(),
      title: '',
      body: '',
      done: false
    });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Title
          <input type="text" name="title" value={this.state.title} onChange={this.updateTitle} />
        </label>
        <label>
          Body
          <input type="text" name="body" value={this.state.body} onChange={this.updateBody} />
        </label>
        <input type="submit" value="Create Todos" />
      </form>
    );
  }
}
