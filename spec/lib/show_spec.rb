require 'spec_helper'

describe TvRageWrapper::Show do 
        it "should initialize the class variables properly" do
                show = 'test'
                stub_get("/search.php?show=#{show}", "search.xml")
                stub_get("/episode_list.php?sid=1", "episode_list.xml")

                show = TvRageWrapper::Show.new('test')

                show.name.should == 'test'
                show.full_name.should == 'Buffy the Vampire Slayer'
                show.genres.should == ['Action', 'Adventure', 'Comedy', 'Drama', 'Mystery', 'Sci-Fi']
                show.id.should == '1'
                show.country.should == 'US'
                show.status.should == 'Canceled/Ended'
                show.classification.should == 'Scripted'
                show.started.should == '1997'
                show.ended.should == '2003'
                show.seasons.should == '7'

                show.episodes[1][1].should be_kind_of(TvRageWrapper::Episode)
                show.episodes[1][2].should be_kind_of(TvRageWrapper::Episode)
                show.episodes[2][1].should be_kind_of(TvRageWrapper::Episode)
                show.episodes[2][2].should be_kind_of(TvRageWrapper::Episode)
        end

end