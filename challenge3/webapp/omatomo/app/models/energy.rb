require 'csv'
require 'kconv'
class Energy < ApplicationRecord
  belongs_to :house
  
  validates :label,             presence: true
  validates :house_id,          presence: true
	validates :house,             presence: true
	validates :year,              presence: true
  validates :month,             presence: true
	validates :temperature,       presence: true
	validates :daylight,          presence: true
  validates :energy_production, presence: true

  def Energy.import_csv(csv_file)
    csv_text = csv_file.read

		data = []

    #文字列をUTF-8に変換
    CSV.parse(Kconv.toutf8(csv_text)) do |row|

      energy = Energy.new
      energy.label             = row[1]
      energy.house_id          = row[2]
      energy.year              = row[3]
      energy.month             = row[4]
      energy.temperature       = row[5]
      energy.daylight          = row[6]
      energy.energy_production  = row[7]

      energy.save
    end
  end
end
