export const fetchPosts = () => {
  return $.ajax({
    method: "GET",
    url: "api/posts"
  });
};

export const deletePost = id => {
  return $.ajax({
    url: `api/posts/${id}`
  });
};
