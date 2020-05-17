class Challenge <ApplicationRecord
  validates_presence_of :theme
  validates_presence_of :project_budget
  has_many :projects
end
