require 'spec_helper'

describe TvRageWrapper::Episode do
  it "should initialize the class variables properly" do
    episode_number = 1
    season_number = 2
    prodnum = "2 WTAI 65"
    date = "1965-09-13"
    link = "http://www.tvrage.com/shows/id-432/episodes/257565"
    title = "Danny Hutton"
    episode = TvRageWrapper::Episode.new(episode_number, season_number, prodnum, date, link, title);
    
    episode.episode_number.should == episode_number
    episode.episode_number_in_season.should == season_number
    episode.prodnum.should == prodnum
    episode.date.should == date
    episode.link.should == link
    episode.title.should == title
  end
end