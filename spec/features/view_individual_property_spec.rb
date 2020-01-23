feature 'viewing an individual property' do
  scenario 'being about to click link to full property details' do
    visit '/listings'
    click_link 'Sams Manor'
    expect(current_path).to eq('/listings/:id')
    expect(page).to have_content('Palace in the wopwops')
  end
end
