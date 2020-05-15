require 'rails_helper'

RSpec.describe "When I visit a project's show page '/projects/:id'" do
  it "I see that project's name and material" do
    project_1 = Project.create(name: "Litfit", material: "Lamp Shade")
    challenge_1 = Challenge.create(theme: "Apartment Furnishings")

    visit "/projects/#{project_1.id}"
    
    expect(page).to have_content(project_1.name)
    expect(page).to have_content("Material: #{project_1.material}")
    expect(page).not_to have_content("Challenge Theme: #{challenge_1.theme}")
  end
end





# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
