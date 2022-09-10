require 'comment_repository'

RSpec.describe CommentRepository do

  def reset_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'blog' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_table
  end

end