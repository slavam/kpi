# coding: utf-8
class KpiTemplatesController < ApplicationController
  def index
    @templates = KpiTemplate.order(:name)
  end

end