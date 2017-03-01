require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?


before '/' do
  #unless session[:user].nil?
  erb :top
end

get '/' do
  @articles = Articles.all
  @categories = Category.all
  
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
        souce: params[:souce],
        url: params[:url],
        category_id: params[:category],
        keyword: params[:keyword],
        url: params[:url],
        summary1: params[:summary1],
        summary2: params[:summary2],
        summary3: params[:summary3],
        content: params[:content],
        comment: params[:comment],
        })
    redirect '/'
end


post '/article/[:id]/detail' do
  @article = Article.all
  erb :detail
end


get '/memo/:id/edit' do
    @categories = Category.all
    @articles = Article.find_by({id: params[:id]})
      if @articles.nil?
        redirect '/'
      end
    erb :edit
end


post '/article/:id/update' do
    @article = Article.find_by({id: params[:id]})
    if @article.nil?
        redirect '/'
    end
    @article.update({
        title: params[:title],
        content: params[:content],
        souce: params[:souce],
        url: params[:url],
        category_id: params[:category],
        keyword: params[:keyword],
        url: params[:url],
        summary1: params[:summary1],
        summary2: params[:summary2],
        summary3: params[:summary3],
        content: params[:content],
        comment: params[:comment],
    })
    @memo.save

    redirect '/'
end


get '/article/:id/delate' do
    @article = Article.find_by({id: params[:id]})
    unless @article.nil?
        @article.destroy
    end

    redirect '/'
end

get '/info' do
  erb :info_form
end