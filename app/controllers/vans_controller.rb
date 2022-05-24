class VansController < ApplicationController
  def index
  end

  def show
    @van = params[:id]
  end

  def new
  end

  def create
  end
end
