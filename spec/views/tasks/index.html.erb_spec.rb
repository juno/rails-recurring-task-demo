require 'spec_helper'

describe "/tasks/index.html.erb" do
  include TasksHelper

  before(:each) do
    assigns[:tasks] = [
      stub_model(Task),
      stub_model(Task)
    ]
  end

  it "renders a list of tasks" do
    render
  end
end
