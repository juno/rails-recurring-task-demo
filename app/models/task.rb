class Task < ActiveRecord::Base
  serialize :options, Hash
  serialize :schedule, Hash

  validates_presence_of :action
  validates_presence_of :name
  validates_presence_of :options
  validates_presence_of :schedule
  validates_presence_of :state
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

