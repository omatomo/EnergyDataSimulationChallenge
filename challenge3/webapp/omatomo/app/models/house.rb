require 'csv'
require 'kconv'
class House < ApplicationRecord
	has_many :energies

	validates :firstname, presence: true
	validates :lastname,  presence: true
	validates :city,      presence: true

	def House.import_csv(csv_file)
		csv_text = csv_file.read

		data = []

    #文字列をUTF-8に変換
    CSV.parse(Kconv.toutf8(csv_text)) do |row|

      house = House.new
      house.firstname        = row[1]
      house.lastname         = row[2]
      house.city             = row[3]
      house.num_of_people    = row[4]
      house.has_child        = row[5]

      house.save
    end
  end
end
