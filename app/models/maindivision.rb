class Maindivision < Department
  has_many :subdivisions, :foreign_key => 'parent_id'
  set_table_name "div2doc"
end