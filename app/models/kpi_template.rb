class KpiTemplate < ActiveRecord::Base
  has_many :weight_factors
  has_many :performances
  set_table_name "templates"
end