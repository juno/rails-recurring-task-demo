require 'spec_helper'

describe "/tasks/show.html.erb" do
  include TasksHelper
  before(:each) do
    assigns[:task] = @task = stub_model(Task)
  end

  it "renders attributes in <p>" do
    render
  end
end
