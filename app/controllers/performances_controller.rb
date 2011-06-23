# coding: utf-8
class PerformancesController < ApplicationController
  def index
    @performances = Performance.order(:division_id)
  end
end