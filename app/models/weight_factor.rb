class WeightFactor < ActiveRecord::Base
  belongs_to :factor, :class_name => 'Factor', :foreign_key => 'factor_id'
  belongs_to :kpi_template, :class_name => 'KpiTemplate', :foreign_key => 'template_id'
end