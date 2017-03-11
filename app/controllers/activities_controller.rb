class ActivitiesController < ApplicationController
  before_action :current_user_must_be_activity_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_activity_user
    activity = Activity.find(params[:id])

    unless current_user == activity.contributor
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @activities = Activity.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@activities.where.not(:location_latitude => nil)) do |activity, marker|
      marker.lat activity.location_latitude
      marker.lng activity.location_longitude
      marker.infowindow "<h5><a href='/activities/#{activity.id}'>#{activity.name}</a></h5><small>#{activity.location_formatted_address}</small>"
    end

    render("activities/index.html.erb")
  end

  def show
    @date_night = DateNight.new
    @activity = Activity.find(params[:id])

    render("activities/show.html.erb")
  end

  def new
    @activity = Activity.new

    render("activities/new.html.erb")
  end

  def create
    @activity = Activity.new

    @activity.name = params[:name]
    @activity.location = params[:location]
    @activity.contributor_id = params[:contributor_id]

    save_status = @activity.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/activities/new", "/create_activity"
        redirect_to("/activities")
      else
        redirect_back(:fallback_location => "/", :notice => "Activity created successfully.")
      end
    else
      render("activities/new.html.erb")
    end
  end

  def edit
    @activity = Activity.find(params[:id])

    render("activities/edit.html.erb")
  end

  def update
    @activity = Activity.find(params[:id])

    @activity.name = params[:name]
    @activity.location = params[:location]
    @activity.contributor_id = params[:contributor_id]

    save_status = @activity.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/activities/#{@activity.id}/edit", "/update_activity"
        redirect_to("/activities/#{@activity.id}", :notice => "Activity updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Activity updated successfully.")
      end
    else
      render("activities/edit.html.erb")
    end
  end

  def destroy
    @activity = Activity.find(params[:id])

    @activity.destroy

    if URI(request.referer).path == "/activities/#{@activity.id}"
      redirect_to("/", :notice => "Activity deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Activity deleted.")
    end
  end
end
