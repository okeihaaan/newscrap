require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?


before '/' do
  #unless session[:user].nil?
  erb :top
end

get '/' do
  @article = Articles.all
  erb :index
end


# get '/sign_up' do
#   erb :sign_up
# end

# post '/sign_up' do
#   #(user: params[:user])
#   redirect '/'
# end


# get '/sign_in' do
#   erb :sign_in
# end
    
# post '/sign_up' do
#   redirect '/'
# end


# get '/sign_out' do
#   redirect '/'
# end


get '/scrap' do
  erb :scrap_form
end

post '/scrap' do
    Memo.create({
        title: params[:title],
        content: params[:content],
        category_id: params[:category],
        })
    redirect '/'
end


post '/article/[:id]/detail' do
  @article = Article.all
  erb :detail
end


get '/article/[:id]/edit' do
  erb :edit
end

post '/article/[:id]/edit' do
  #(article: params[:article])
  redirect '/[:id]/detail'
end


post '/article/[:id]/delate' do
  params[:id].delate
  redirect '/'
end

get '/info' do
  erb :info_form
end