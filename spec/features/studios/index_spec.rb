require 'rails_helper'

describe 'Studio index page' do
  pbf = Studio.create(name: "Pizza Baby Films", location: "Waltham")
  magic = Studio.create(name: "Magic Goat Productions", location: "Everywhere")

  ascendants = pbf.movies.create(title: "Ascendants", creation_year: "2009", genre: "sci-fi")
  flash_flood = magic.movies.create(title: "Flash Flood", creation_year: "2017", genre: "structural")

  it 'displays all studio names' do
    visit '/studios'

    expect(page).to have_content(pbf.name)
    expect(page).to have_content(magic.name)
  end

  it 'displays movie names after studio' do
    visit '/studios'

    within "#studio-#{pbf.id}" do
      expect(page).to have_content(ascendants.title)
      expect(page).to_not have_content(flash_flood.title)
    end
  end
end