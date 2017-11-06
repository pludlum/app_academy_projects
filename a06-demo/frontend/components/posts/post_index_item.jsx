import React from 'react';
import { Link, withRouter } from 'react-router-dom';

const PostIndexItem = props => (
  <div>
    <Link to={`/posts/${props.post.id}`}>{props.post.title}</Link>
    <Link to={`/posts/${props.post.id}/edit`}>Edit</Link>
    <button onClick={() => props.deletePost(props.post.id)}>Delete</button>
  </div>
);

export default PostIndexItem;
