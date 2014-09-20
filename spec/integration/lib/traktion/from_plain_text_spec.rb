require 'spec_helper'

describe Traktion::FromPlainText do
  let(:from_plain_text) { Traktion::FromPlainText.use(plain_text_pathname) }
  let(:plain_text_pathname) { Pathname.new("spec/fixtures/files/itunes_plain_text.txt") }

  describe '#process' do
    subject { from_plain_text.process }

    it { should be_true }
  end

  describe '#track_data' do
    let(:track_data) do
     [
       {:name=>"Track Name", :artist=>"Artist Name", :album=>"Album Name", :genre=>"Genre", :size=>"10275412", :time=>"235", :year=>"2014", :date_modified=>"4/13/14 3:27 PM", :date_added=>"3/25/14 2:55 PM", :bit_rate=>"320", :sample_rate=>"44100", :kind=>"MPEG audio file", :comments=>"Some Comments", :plays=>"1", :last_played=>"3/27/14 9:23 AM", :location=>"Macintosh HD:Users:drewbisset:Music:Dance Music:Music:Artist Name:Album Name:Track Name.mp3"},
       {:name=>"Another Track Name Lacking Additional Meta Data", :size=>"704526", :time=>"3", :date_modified=>"4/13/14 3:26 PM", :date_added=>"4/13/14 3:26 PM", :bit_rate=>"1411", :sample_rate=>"44100", :kind=>"WAV audio file", :location=>"Macintosh HD:Users:drewbisset:Music:Dance Music:Music:Unknown Artist:Unknown Album:Another Track Name Lacking Additional Meta Data.wav"}
     ]
    end

    before do
      from_plain_text.process
    end

    subject { from_plain_text.track_data }

    it { should == track_data }
  end
end
