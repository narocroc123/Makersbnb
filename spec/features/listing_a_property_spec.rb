feature 'listings page' do
  scenario 'ability to list a property' do
    visit('/listings/new')
    fill_in 'property_name', with: 'Chateux De Grotto'
    fill_in 'description', with: 'Fun in the sun'
    fill_in 'price', with: '1000'
    fill_in 'available_date', with: '2020-06-12'
    click_button 'List Property'
    expect(page).to have_content('Chateux De Grotto')
  end
end
