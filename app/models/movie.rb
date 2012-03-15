class Movie < ActiveRecord::Base
	def self.all_ratings
		# should these be symbols?
		['G', 'PG', 'PG-13', 'R']
	end
end
