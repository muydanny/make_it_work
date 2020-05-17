class Project <ApplicationRecord
  validates_presence_of :material
  validates_presence_of :name
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestants_count
    contestants.count  
  end
end
