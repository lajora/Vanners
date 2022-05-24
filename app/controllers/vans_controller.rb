class VansController < ApplicationController
  def index
  end

  def show
    @van = Van.find(params[:id])
  end

  def new
  end

  def create
  end
end
