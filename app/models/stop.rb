class Stop < ActiveRecord::Base
  has_many :photos

  def self.next
    Stop.where("date >= ?", Time.zone.today).order(:date).first
  end

  def long_name
    "#{name} - #{date.strftime("%m/%d/%y")}"
  end

  def token
    "#{date.strftime("%m/%d/%y")}:#{name}"
  end
end
