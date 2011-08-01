# coding: utf-8
class MaindivisionsController < ApplicationController
  before_filter :find_department, :only => [:my_show, :edit, :update, :destroy]
  def index
    @maindivisions = Subdivision.select([:id_division, :parent_id, :division, :code_division]).order(:id_division).paginate :page => params[:page], :per_page => 20
  end
  
  def my_show
  end

  private
  def find_department
    @maindivisions = Subdivision.select([:id_division, :parent_id, :division, :code_division]).where("id_division=?", params[:id])
    @department = @maindivisions[0]
  end
end