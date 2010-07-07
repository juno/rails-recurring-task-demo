class Task < ActiveRecord::Base
end

# == Schema Information
# Schema version: 20100707075605
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
#

