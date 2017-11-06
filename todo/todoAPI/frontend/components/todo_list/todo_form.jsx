import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: '',
      body: '',
      done: false,
      id: this.uniqueId(),
      tag_names: []
    };

    this.handleTitle = this.handleTitle.bind(this);
    this.handleBody = this.handleBody.bind(this);
    this.submitTodo = this.submitTodo.bind(this);
  }

  handleTitle() {
    return (e) => this.setState({title: e.target.value});
  }

  handleBody() {
    return (e) => this.setState({body: e.target.value});
  }

  handleNewTag(e) {
    e.preventDefault();
    const tags = this.state.tag_names.concat(this.ref.input.value);
    this.setState({tag_names: tags});
  }

  submitTodo(e) {
    e.preventDefault();
    const todo = this.state;
    this.props.createTodo({todo}).then(
      () => this.setState({
        title: '',
        body: '',
        id: this.uniqueId()
        }),
      this.props.clearErrors()
    );

  }

  uniqueId() {
    return new Date().getTime();
  }

  render() {
    return (
      <form onSubmit={this.submitTodo}>
        <div>
          <h2>{this.props.errors}</h2>
          <h2>Tags:
            <ul>
              {this.state.tag_names}
            </ul>
            <input ref='input'  />
            <button type="button" onClick={this.handleNewTag}> A Tag!</button>

          <br/>
          </h2>
          Title:
          <input onChange={this.handleTitle()} name='todo[title]' value={this.state.title}/>
          <br/>
          Body:
          <input onChange={this.handleBody()} name='todo[body]' value={this.state.body}/>
          <button>Submit!</button>
        </div>
      </form>
    );
  }
}

export default TodoForm;
