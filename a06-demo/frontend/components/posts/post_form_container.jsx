import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';
import PostForm from './post_form';
import { fetchPost, createPost, updatePost } from '../../actions/post_actions';

const mapStateToProps = (state, ownProps) => {
  let post = { title: "", body: "" };
  let formType = "new";

  if (ownProps.match.params.postId) {
    post = state.posts[ownProps.match.params.postId];
    formType = "edit";
  }

  return { post, formType };
};

const mapDispatchToProps = (dispatch, ownProps) => ({
  fetchPost: id => dispatch(fetchPost(id)),
  action: post => (ownProps.match.params.postId) ? (
    dispatch(updatePost(post))
  ) : (
    dispatch(createPost(post))
  )
});

export default withRouter(connect(
  mapStateToProps,
  mapDispatchToProps
)(PostForm));
