describe "test", type: :feature do
it "works" do
  visit '/'
end
end

feature "something" do
  scenario "something" do
    visit("/")
  end
end
