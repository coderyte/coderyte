class Registrant < ActiveRecord::Base
	has_no_table

	column :reason, :text
	column :problem, :text
	column :story, :text
	column :more_story, :string
	column :price_range, :string
	column :experience, :text
	column :first_name, :string
	column :last_name, :string
	column :email, :string
	column :phone, :string
	column :age, :integer
	column :residence, :string
	column :education, :string

	validates :reason, :problem, :story, :more_story, :price_range, :experience, :first_name, :last_name, :email, :phone, :age, :residence, :education, presence: true

	validates_format_of :email, 
											:with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

	validates_length_of :reason, :problem, :story, :experience,
											:maximum => 500

	validates_numericality_of :age



end