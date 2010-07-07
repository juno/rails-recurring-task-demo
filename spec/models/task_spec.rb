require 'spec_helper'

describe Task do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Task.create!(@valid_attributes)
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

