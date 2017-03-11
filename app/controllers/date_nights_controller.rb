class DateNightsController < ApplicationController
  def index
    @date_nights = DateNight.all

    render("date_nights/index.html.erb")
  end

  def show
    @date_night = DateNight.find(params[:id])

    render("date_nights/show.html.erb")
  end

  def new
    @date_night = DateNight.new

    render("date_nights/new.html.erb")
  end

  def create
    @date_night = DateNight.new

    @date_night.user_id = params[:user_id]
    @date_night.date_id = params[:date_id]
    @date_night.restaurant_id = params[:restaurant_id]
    @date_night.activity_id = params[:activity_id]
    @date_night.day = params[:day]

    save_status = @date_night.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/date_nights/new", "/create_date_night"
        redirect_to("/date_nights")
      else
        redirect_back(:fallback_location => "/", :notice => "Date night created successfully.")
      end
    else
      render("date_nights/new.html.erb")
    end
  end

  def edit
    @date_night = DateNight.find(params[:id])

    render("date_nights/edit.html.erb")
  end

  def update
    @date_night = DateNight.find(params[:id])

    @date_night.user_id = params[:user_id]
    @date_night.date_id = params[:date_id]
    @date_night.restaurant_id = params[:restaurant_id]
    @date_night.activity_id = params[:activity_id]
    @date_night.day = params[:day]

    save_status = @date_night.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/date_nights/#{@date_night.id}/edit", "/update_date_night"
        redirect_to("/date_nights/#{@date_night.id}", :notice => "Date night updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Date night updated successfully.")
      end
    else
      render("date_nights/edit.html.erb")
    end
  end

  def destroy
    @date_night = DateNight.find(params[:id])

    @date_night.destroy

    if URI(request.referer).path == "/date_nights/#{@date_night.id}"
      redirect_to("/", :notice => "Date night deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Date night deleted.")
    end
  end
end