# coding: utf-8
class FactorsController < ApplicationController
  before_filter :find_factor, :only => [:show, :destroy, :show_values]
  def index
#    @factors = @block.factors.order("weight desc")
    @factors = Factor.order(:name)
  end
  
  def show
  end

  def show_factors_by_template
    @factors = Factor.find_by_sql("SELECT f.*, wf.weight factor_weight FROM factors f
      JOIN weight_factors wf ON f.id=wf.factor_id AND wf.template_id ="+params[:template_id]+
      ' order by wf.template_id, f.block_id')
  end

  def show_values
    @values = @factor.performances.order(:calc_date)  
  end
  
  def new
    @factor = Factor.new
  end
  
  def create
    @factor = Factor.new params[:factor]
    if not @factor.save
      render :new
    else
      @weight = WeightFactor.new
      @weight.factor_id = @factor.id
      @weight.template_id = params[:weight_factor][:template_id]
      @weight.weight = params[:weight_factor][:weight]
      @weight.save
      redirect_to :factors
    end
  end
  
  def destroy
    @factor.destroy
    redirect_to factors_path
  end
 
  private
  
#  def find_block
#    @block = Block.find params[:format]
#  end
  
  def find_factor
    @factor = Factor.find params[:id]
  end
end