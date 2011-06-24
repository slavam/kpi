# coding: utf-8
class PerformancesController < ApplicationController
  def index
    @performances = Performance.order(:division_id)
  end

  def get_report_params
  end
    
  def show_report
    @performances = Performance.find_by_sql("SELECT p.*, wf.weight weight_factor 
      from performances p
      join weight_factors wf on wf.template_id = p.template_id and wf.factor_id=p.factor_id
      where division_id="+params[:report_params][:division_id].to_s+
      " and p.template_id="+params[:report_params][:template_id].to_s+ 
      " order by block_id, factor_id")
#    @performances = Performance.where("division_id=? and template_id=? ", 
#      params[:report_params][:division_id], params[:report_params][:template_id]).
#      order("block_id, factor_id")
  end
  
end