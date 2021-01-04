require 'rails_helper'

describe 'Movie show page' do
  magic = Studio.create(name: "Magic Goat Productions", location: "Everywhere")
  flash_flood = magic.movies.create(title: "Flash Flood", creation_year: "2017", genre: "structural")
  carrie = Actor.create(name: "Carrie Fisher", age: 45)
  mark = Actor.create(name: "Mark Hammill", age: 55)

  Cast.create(movie_id: flash_flood.id, actor_id: mark.id)
  Cast.create(movie_id: flash_flood.id, actor_id: carrie.id)

  it "displays all relevant information" do  
    visit "/movies/#{flash_flood.id}"

    expect(page).to have_content(flash_flood.title)
    expect(page).to have_content(flash_flood.genre)
    expect(page).to have_content("Average actor age: #{flash_flood.actors.average_age}")
    expect(page).to have_content(flash_flood.creation_year)

    within "#actor-1" do
      expect(page).to have_content(carrie.name)
    end
  end
end