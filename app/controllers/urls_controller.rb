class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    # Get 
    original_url = url_params[:original_url]
    @url = Url.new(url_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to info_path(@url.shortened_url), notice: "Tiny, shortened, URL was successfully created." }
      else
        format.html { redirect_to root_path(original_url: original_url), status: :unprocessable_entity }
      end
    end
  end

  def show
    # Find url to show
    @url = Url.find_by(shortened_url: params[:shortened_url])
    # Create and find ip of the request 
    @url.url_visits.create(url: @url, ip_address: request.remote_ip)

    redirect_to @url.original_url_formatted
  end

  def info
    @url = Url.includes(:url_visits).find_by(shortened_url: params[:shortened_url])

    unless @url.present?
      redirect_to root_path, alert: 'Error, URL is not present.'
    end
  end

  private
    def url_params
      params.require(:url).permit(:original_url)
    end
    
end
