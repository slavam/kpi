# coding: utf-8
class KpiTemplatesController < ApplicationController
  before_filter :find_kpi_template, :only => [:destroy, :edit, :update]
  def index
    @templates = KpiTemplate.order(:name)
  end

  def new
    @kpi_template = KpiTemplate.new
  end
  
  def create
    @kpi_template = KpiTemplate.new params[:kpi_template]
    if not @kpi_template.save
      render :new
    else
      redirect_to :kpi_templates
    end
  end

  def edit
  end

  def update
    if not @kpi_template.update_attributes params[:kpi_template]
      render :action => :edit
    else
      redirect_to kpi_templates_path
    end
  end
  
  private
  
  def find_kpi_template
    if params[:id]
      @kpi_template = KpiTemplate.find params[:id]
    else
      @kpi_template = KpiTemplate.find params[:kpi_template][:id]
    end  
  end

end