describe Listings do
  it 'is an instance of Listing' do
    listings = Listings.all
    listing = listings.first

    expect(listing.property_name).to eq('Sams Manor')
    expect(listing.description).to eq('Palace in the wopwops')
    expect(listing.available_date).to eq('2020-04-03')
    expect(listing.price).to eq('4')
    expect(listing.available).to eq('t')
  end

  it 'should create a new listing' do
    Listings.create(property_name: 'The Fergus Cottage', description: 'Relaxation in the city', available_date: '2020-05-19', price: '30', available: 't')
    listing = Listings.all.last

    expect(listing.property_name).to eq('The Fergus Cottage')
    expect(listing.description).to eq('Relaxation in the city')
    expect(listing.available_date).to eq('2020-05-19')
    expect(listing.price).to eq('30')
    expect(listing.available).to eq('t')
  end
end
