class Income < ActiveRecord::Base
  validates :value, presence: true
  belongs_to :subcategory
  belongs_to :user

  def self.group_by_subcategory(incomes = Income.all)
    incomes.group_by(&:subcategory).map do |subcategory, incomes|
      [subcategory&.title, incomes.map(&:value).reduce(:+)]
    end
  end
end
