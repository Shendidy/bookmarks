# frozen_string_literal: true

# Class comments
class Url
  attr_accessor :address, :title

  def initialize(address, title)
    @address = address
    @title = title
  end

  def self.create(adress, title)
    @url = Url.new(adress, title)
  end

  def self.instance
    @url
  end
end
