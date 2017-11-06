import React from 'react';

class PostForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = this.props.post;
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    console.log(this.props.match.params);
    if (this.props.formType === "edit") {
      this.props.fetchPost(this.props.match.params.postId);
    }
  }

  update(field) {
    return (e) => {
      e.preventDefault();
      this.setState({
        [field]: e.target.value
      });
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.action(this.state);
  }

  render () {
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <label>Title
            <input type='text' onChange={this.update("title")} value={this.state.title} />
          </label>
          <label>Body
            <textarea onChange={this.update("body")} value={this.state.body} />
          </label>
        </form>
      </div>
    );
  }
}

export default PostForm;
