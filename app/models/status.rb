class Status < ActiveRecord::Base

	has_many :searches

	STATUSES = ['confirmed', 'possible', 'suspect', 'invalid', 'internal error']

	validates :name, inclusion: { in: STATUSES }
end
