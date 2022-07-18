class Notification < ApplicationRecord


  before_save :default_values
  #assign d default value as false if null(nil)
  def default_values
    self.seen = false if self.seen.nil?
  end
end
