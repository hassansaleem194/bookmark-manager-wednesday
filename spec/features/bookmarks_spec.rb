
feature 'See a list of bookmarks: ' do
  scenario 'user can visit the page and see a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url, name) VALUES ('http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks (url, name) VALUES('http://www.destroyallsoftware.com', 'Destroy All Software');")
    connection.exec("INSERT INTO bookmarks (url, name) VALUES('http://www.google.com', 'Google');")


    
    visit('/bookmarks')

    expect(page).to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software', href: 'http://www.destroyallsoftware.com')
  end
end
