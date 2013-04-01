require 'httparty'

module TvRageWrapper
	class Episode
		attr_reader :episode_number, :episode_number_in_season, :prodnum, :date, :link, :title

		@episode_number = 0
		@episode_number_in_season = 0
		@prodnum = 0
		@date = 0
		@link = 0
		@title = ''

		def initialize num, season, prodnum, date, link, title
			@episode_number = num
			@episode_number_in_season = season
			@prodnum = prodnum
			@date = date
			@link = link
			@title = title
		end
	end
end