class KpiTemplate < ActiveRecord::Base
  has_many :weight_factors, :foreign_key => 'template_id'
  has_many :performances
  set_table_name "templates"
end