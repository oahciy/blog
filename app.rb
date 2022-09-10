# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/post_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('blog')

repo = PostRepository.new
result = repo.find_with_comments(1)
post_title = result[0]
post_content = result[1]
comment_1_content = result.last[0].content
comment_1_author = result.last[0].author_name

p "#{post_title} - #{post_content} - #{comment_1_content} - #{comment_1_author}"