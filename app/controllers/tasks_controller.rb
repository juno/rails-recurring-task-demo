class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.xml
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new
    @weekdays = weekdays_for_select

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task])
    @task.options = { 'identifier' => 'i-00000001' }

    Time.zone = @task.name

    schedule = build_schedule(params)
    @task.schedule = schedule
    @task.next_occurence = schedule.first[0]

    respond_to do |format|
      if @task.save
        format.html { redirect_to(@task, :notice => 'Task was successfully created.') }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        @weekdays = weekdays_for_select
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@task, :notice => 'Task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end


  private

  # @param [Hash] params
  # @return [IceCube::Schedule]
  def build_schedule(params)
    start_at = Time.zone.now

    rule = IceCube::Rule.weekly
    params[:weekdays].each do |weekday|
      rule.day(weekday.to_sym)
    end
    rule.hour_of_day(params[:hour].to_i)
    rule.minute_of_hour(0)
    rule.second_of_minute(0)

    schedule = IceCube::Schedule.new(start_at)
    schedule.add_recurrence_rule(rule)
    schedule
  end

  # @return [Hash{Symbol => String}]
  def weekdays_for_select
    [
     { :id => 'monday', :name => '月' },
     { :id => 'tuesday', :name => '火' },
     { :id => 'wednesday', :name => '水' },
     { :id => 'thursday', :name => '木' },
     { :id => 'friday', :name => '金' },
     { :id => 'saturday', :name => '土' },
     { :id => 'sunday', :name => '日' },
    ]
  end
end
