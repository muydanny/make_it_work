require 'rails_helper'


RSpec.describe Contestant, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :hometown}
    it {should validate_presence_of :years_of_experience}
  end

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe "methods" do
    before do
      challenge = Challenge.create(theme: "ocean", project_budget: 10)
      @project = Project.create(name: "project 1", material: "wood", challenge_id: challenge.id)
      @contestant = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      ContestantProject.create(contestant_id: @contestant.id, project_id: @project.id)
    end

    it "project_names returns the name of the projects" do
      expect(@contestant.project_names).to eq(@project.name)
    end
  end
end
