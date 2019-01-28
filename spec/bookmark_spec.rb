require 'bookmark.rb'
describe Bookmark do
  describe ".all" do
    it "should return a list of bookmarks" do
      expect(Bookmark.all).to eq(['tumblr.com'])
    end
  end

end
