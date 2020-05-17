require 'rails_helper'

RSpec.describe "When I visit a project's show page '/projects/:id'" do
  before(:each) do
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    @animal_material_challenge = Challenge.create(theme: "Animal Materials", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @furniture_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    @leatherfeather = @animal_material_challenge.projects.create(name: "LeatherFeather", material: "Feathers")

    ContestantProject.create(contestant_id: @kentaro.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @jay.id, project_id: @leatherfeather.id)
  end

  it "I see that project's name and material" do

    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content(@news_chic.name)
    expect(page).to have_content("Material: #{@news_chic.material}")
    expect(page).to have_content("Challenge Theme: #{@recycled_material_challenge.theme}")
    expect(page).to_not have_content(@boardfit.name)
    expect(page).to_not have_content("Material: #{@boardfit.material}")
    expect(page).to_not have_content("Challenge Theme: #{@furniture_challenge.theme}")
  end
  it "I see a count of the number of contestants on this project" do

    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content(@news_chic.name)
    expect(page).to have_content("Material: #{@news_chic.material}")
    expect(page).to have_content("Challenge Theme: #{@recycled_material_challenge.theme}")
    expect(page).to have_content("Number of Contestants: #{@news_chic.contestants_count}")
    expect(page).to_not have_content(@boardfit.name)
    expect(page).to_not have_content("Material: #{@boardfit.material}")
    expect(page).to_not have_content("Challenge Theme: #{@furniture_challenge.theme}")
  end
end





# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)

# When I visit a project's show page
# I see a count of the number of contestants on this project
# ​
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3 )
