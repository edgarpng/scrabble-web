class Play < ActiveRecord::Base
  before_create :set_date
  attr_accessible :date
  belongs_to :word, counter_cache: true

  private
  def set_date
    self.date = DateTime.now
  end
end