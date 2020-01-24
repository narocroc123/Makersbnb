feature 'listing page' do
  scenario 'user visits /listings and can see a list of properties' do
    visit '/listings'
    expect(page).to have_content('Sams Manor')
  end
end
