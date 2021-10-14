feature 'index:' do
  scenario 'can run app and check index page' do
    visit('/')
    expect(page).to have_content 'This is an index page'
  end
end