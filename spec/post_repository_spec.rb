require 'post_repository'

RSpec.describe PostRepository do

  def reset_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'blog' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_table
  end

  it "finds post with its comments" do
    repo = PostRepository.new
    result = repo.find_with_comments(1)
    post_title = result[0]
    post_content = result[1]
    comment_1_content = result.last[0].content
    comment_1_author = result.last[0].author_name
    expect(post_title).to eq 'blog 101'
    expect(post_content).to eq 'Say hello to me'
    expect(comment_1_content).to eq 'hello'
    expect(comment_1_author).to eq 'yichao'
  end
end