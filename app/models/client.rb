class Client < ApplicationRecord
  require 'csv'
  validates :name,   :presence => true
  validates :email,  :presence => true

  has_and_belongs_to_many :professions

  def self.to_csv
    attributes = %w{id name email professions}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |client|
        csv << attributes.map{ |attr| attr == "professions" ?  client.professions.pluck(:name).join(",") : client.send(attr) }
      end
    end
  end
end
