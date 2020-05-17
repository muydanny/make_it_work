require 'rails_helper'

RSpec.describe "When I visit the contestants index page /contestants" do
  before(:each) do
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    animal_material_challenge = Challenge.create(theme: "Animal Materials", project_budget: 1000)

    @news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = furniture_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    @leatherfeather = animal_material_challenge.projects.create(name: "LeatherFeather", material: "Feathers")

    ContestantProject.create(contestant_id: @kentaro.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @jay.id, project_id: @leatherfeather.id)
  end

  it "I see a list of names of all the contestants and list of projects theyve been on" do

    visit "/contestants"

    within "#contestant-#{@kentaro.id}" do
      expect(page).to have_content(@kentaro.name)
      expect(page).to have_content("Projects: #{@news_chic.name}, #{@boardfit.name}")
    end
    within "#contestant-#{@jay.id}" do
      expect(page).to have_content(@jay.name)
      expect(page).to have_content("Projects: #{@leatherfeather.name}")
    end
    within "#contestant-#{@erin.id}" do
      expect(page).to have_content(@erin.name)
      expect(page).to have_content("Projects:")
    end
  end
end

# As a visitor,
# When I visit the contestants index page ("/contestants")
# I see a list of names of all the contestants
# And under each contestants name I see a list of the projects (names) that they've been on
# ​
# (e.g.   Kentaro Kameyama
#         Projects: Litfit, Rug Tuxedo
# ​
#         Jay McCarroll
#         Projects: LeatherFeather)
