class Actor < ApplicationRecord
  has_many :casts
  has_many :movies, through: :casts
  default_scope { order(age: :asc)}

  def self.average_age
    self.average(:age)
  end

  def costars
    costars = movies.joins(:actors).distinct.pluck(:name)
    costars.delete(self.name)
  end
end