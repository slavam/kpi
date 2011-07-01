class Performance < ActiveRecord::Base
  belongs_to :block, :class_name => 'Block', :foreign_key => 'block_id'
  belongs_to :division, :class_name => 'Division', :foreign_key => 'division_id'
  belongs_to :kpi_template, :class_name => 'KpiTemplate', :foreign_key => 'template_id'
  belongs_to :factor, :class_name => 'Factor', :foreign_key => 'factor_id'
  
  def self.kpi_on(date)
     p date.to_s+">>>>>>>>>>>>>>>"
    where("date(calc_date) = ?", date).sum("kpi")
  end
end