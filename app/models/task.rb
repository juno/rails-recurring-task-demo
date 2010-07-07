class Task < ActiveRecord::Base
  include IceCube

  serialize :options, Hash

  validates_presence_of :action
  validates_presence_of :name
  validates_presence_of :options
  validates_presence_of :schedule
  validates_presence_of :state

  # @return [IceCube::Schedule]
  def schedule
    if read_attribute(:schedule)
      Schedule.from_yaml(read_attribute(:schedule))
    else
      nil
    end
  end

  # @param [IceCube::Schedule]
  def schedule=(value)
    write_attribute(:schedule, value.to_yaml)
  end
end


# == Schema Information
# Schema version: 20100707084131
#
# Table name: tasks
#
#  id             :integer         not null, primary key
#  state          :string(255)     not null
#  action         :string(255)     not null
#  options        :text            not null
#  schedule       :text            not null
#  next_occurence :datetime
#  created_at     :datetime
#  updated_at     :datetime
#  name           :string(255)     not null
#

