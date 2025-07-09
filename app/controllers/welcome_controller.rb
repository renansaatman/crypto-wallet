class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails - Jackson Pires (Cookie)"
    session[:name] = "Renan (Sessions)"
    @urlParams = params
    @nome = params[:nome] || session[:name]
    @curso = params[:curso] || cookies[:curso]
  end
end
