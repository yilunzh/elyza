class Status < ActiveRecord::Base

	has_many :searches

	STATUSES = ['confirmed', 'possible', 'suspect', 'invalid', 'internal error']

	validates :name, presence: true, uniqueness: { case_sensitive: false }, inclusion: { in: STATUSES }
end
