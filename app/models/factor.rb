class Factor < ActiveRecord::Base
  belongs_to :block, :class_name => 'Block', :foreign_key => 'block_id'
  has_many :weight_factors, :dependent => :destroy
  has_many :performances
end