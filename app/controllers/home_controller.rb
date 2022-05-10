class HomeController < ApplicationController
  before_action :set_global_summary_service, :breadcrumb_home

  def index
    @summary = @summary_service.general
  end

  def confirmed
    @confirmeds= @summary_service.confirmed
    @pagy, @confirmed = pagy_array(@confirmeds) 
  end

  def recovered
    @recovereds= @summary_service.recovered
    @pagy, @recovered = pagy_array(@recovereds) 
  end

  def deaths
    @deaths_local = @summary_service.deaths
    @pagy, @deaths = pagy_array(@deaths_local) 
  end

  def daily
    @daily_local = @summary_service.daily
    @pagy, @daily = pagy_array(@daily_local) 
  end

  def countries
    if (params[:status]).present? == true
      @country = @summary_service.country(params[:status])
    else
      @countries = @summary_service.countries
      @pagy, @countries = pagy_array(@countries['countries'])
    end
  end

  private 

  def set_global_summary_service
    @summary_service = GlobalSummary.new
  end

  def breadcrumb_home
    breadcrumbs.add "Home", root_path
  end
end
