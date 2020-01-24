feature 'confirmation of booking' do
  scenario 'user can get a confirmation of a booking' do
    visit('/listings')
    click_link('Sams Manor')
    click_button('Book Property')
    expect(page).to have_content('Congratulations')
  end
end
