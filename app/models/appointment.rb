class Appointment < ApplicationRecord
	validates :title, presence: true,
                    length: { minimum: 5 }
    def self.search(search)
	  if search
	    self.where("title like ?", "%#{search}%")
	  else
	    self.all
	  end
		end

	validate :end_after_start
	validates :start_time, :end_time, :presence => true

	private
	def end_after_start
		return if end_time.blank? || start_time.blank?

		if end_time < start_time || end_time == start_time
			errors.add(:end_time, "must be after the start time")
		end
	end

end
