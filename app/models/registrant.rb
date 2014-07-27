class Registrant < ActiveRecord::Base
	has_no_table

	column :reason, :text
	column :problem, :text
	column :story, :text
	column :price_range, :string
	column :experience, :text
	column :first_name, :string
	column :last_name, :string
	column :gender, :string
	column :email, :string
	column :phone, :string
	column :age, :integer
	column :residence, :string
	column :education, :string
	column :about_us, :string

	validates :reason, :problem, :story, :price_range, :experience, :first_name, :last_name, :gender, :email, :phone, :age, :residence, :education, :about_us, presence: true

	validates_format_of :email, 
											:with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

	validates_length_of :reason, :problem, :story, :experience,
											:maximum => 500
	validates :phone,
						:numericality => true,
						:length => {minimum: 10, maximum: 12}

	validates_numericality_of :age

	def update_spreadsheet
		connection = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"])
		ss = connection.spreadsheet_by_title("Codeyte Prospective Applicants")
		if ss.nil?
			ss = connection.create_spreadsheet("Coderyte Prospective Applicants")
		end
		ws = ss.worksheets[0]
		last_row = 1 + ws.num_rows
		ws[last_row, 1] = Time.new
		ws[last_row, 2] = self.first_name
		ws[last_row, 3] = self.last_name
		ws[last_row, 4] = self.gender
		ws[last_row, 5] = self.email
		ws[last_row, 6] = self.phone
		ws[last_row, 7] = self.age
		ws[last_row, 8] = self.education
		ws[last_row, 8] = self.about_us
		ws[last_row, 9] = self.residence
		ws[last_row, 10] = self.reason
		ws[last_row, 11] = self.problem
		ws[last_row, 12] = self.story
		ws[last_row, 13] = self.experience
		ws[last_row, 14] = self.price_range
		ws.save
	end
end