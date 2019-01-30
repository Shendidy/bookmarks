require 'bookmark.rb'
describe Bookmark do
  describe ".all" do
    it "should return a list of bookmarks" do
      expect(Bookmark.all).to include 'http://www.makersacademy.com'
      expect(Bookmark.all).to include 'http://www.google.com'
      expect(Bookmark.all).to include 'http://www.destroyallsoftware.com'
    end
  end

end
