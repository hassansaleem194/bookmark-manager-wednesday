require 'pg'

class Bookmark

  attr_reader :name, :url

  def initialize(name, url)
    @name = name
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| Bookmark.new(bookmark['name'], bookmark['url']) }
  end

  def ==(other_object)
    if other_object.class == self.class
      return self.name == other_object.name && self.url == other_object.url
    end
    
    return false  
  end

end
