class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/messages" do 
    # "Hello world"
    messages = Message.all
    messages.to_json
  end

  post "/messages" do
    new_message = Message.create(
      username: params[:username], 
      body: params[:body]
    )
    new_message.to_json
  end

  patch "/messages/:id" do
    edited_message = Message.find(params[:id])
    edited_message.update(
      body: params[:body]
    )
    edited_message.to_json
  end

  delete "/messages/:id" do
    deleted_message = Message.find(params[:id])
    deleted_message.destroy
    # deleted_message.to_json
  end
  
end
