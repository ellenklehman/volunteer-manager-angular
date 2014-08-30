class Event < ActiveRecord::Base
  has_and_belongs_to_many :volunteers, :join_table => :signups
  validates :name, :presence => true

  def full_name
    "#{name}, #{date}, #{location}"
  end

  def vol_num
    self.volunteers.count
  end

  def recent
    self.created_at > (Time.new - 2*24*60*60)? true : false
  end
end
