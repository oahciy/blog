require_relative 'post'
require_relative 'comment'

class PostRepository
  #print out the data of one post with its comments to the terminal.
  def find_with_comments(id)
    sql = 'SELECT posts.title, posts.content, comments.content AS comment_content, comments.author_name
    FROM posts
      JOIN comments ON comments.post_id = posts.id
    WHERE posts.id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)

    post = Post.new
    post.title = result.first['title']
    post.content = result.first['content']

    result.each do |record|
      comment = Comment.new
      comment.content = record['comment_content']
      comment.author_name = record['author_name']
      post.comments << comment
    end

    return [post.title, post.content, post.comments]

  end
end