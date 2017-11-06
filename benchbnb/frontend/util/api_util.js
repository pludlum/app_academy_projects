

export const postUser = (user) => (
  $.ajax({
    method: 'POST',
    url: '/api/users',
    data: user
  })
);

export const postSession = (user) => (
  $.ajax({
    method: 'POST',
    url: '/api/sessions',
    data: user
  })
);

export const deleteSession = () => (
  $.ajax({
    method: 'DELETE',
    url: '/api/sessions'
  })
);
