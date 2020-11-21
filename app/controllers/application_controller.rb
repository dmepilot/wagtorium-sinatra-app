 require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "demo_test"
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Flash

  get "/" do
    erb :index
  end

  helpers do

    def logged_in?
      !!current_owner
    end

    def current_owner
      @current_owner ||= Owner.find_by(id: session[:owner_id]) if session[:owner_id]
    end

  end

end
