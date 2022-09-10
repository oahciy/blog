TRUNCATE TABLE posts, comments RESTART IDENTITY;

INSERT INTO posts (title, content) VALUES 
  ('blog 101', 'Say hello to me'),
  ('blog 201', 'Music genre introduction');

INSERT INTO comments (content, author_name, post_id) VALUES 
  ('hello', 'yichao', 1),
  ('bye', 'oahciy', 2);

-- SELECT posts.title, posts.content, comments.content AS comment_content, comments.author_name
--   FROM posts
--     JOIN comments ON comments.post_id = posts.id
--   WHERE posts.id = $1;