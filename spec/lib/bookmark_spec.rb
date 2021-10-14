require 'bookmark'

RSpec.describe Bookmark do

  describe '#all' do
    it 'returns an array of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url, name) VALUES ('http://www.makersacademy.com', 'Makers');")
      connection.exec("INSERT INTO bookmarks (url, name) VALUES('http://www.destroyallsoftware.com', 'Destroy All Software');")
      connection.exec("INSERT INTO bookmarks (url, name) VALUES('http://www.google.com', 'Google');")
  



    expect(Bookmark.all).to include Bookmark.new('Destroy All Software', "http://www.destroyallsoftware.com")
    expect(Bookmark.all).to include Bookmark.new('Makers', "http://www.makersacademy.com")
    expect(Bookmark.all).to include Bookmark.new('Google', "http://www.google.com")
    end
  end
end
