class DashboardController < ApplicationController

  before_filter :authenticate_user!


  def get_client
  	### create the you tube client which use to upload the videos
  	$client = YouTubeIt::Client.new(:username => USER_NAME, :password => USER_PASSWORD, :dev_key =>DEV_KEY)
  end

  def index
  end
  ### get the form params and uplaod the video on you tube
  def upload
  	begin
  		get_client
  		$client.video_upload(File.open(params["upload_video"].tempfile), :title => params[:title],:description => params[:description])
  	rescue Exception => ex
  		raise ex
  	end
	 redirect_to dashboard_index_path
  end
end
