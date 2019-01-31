# frozen_string_literal: true

# Class comments
class Url
  attr_accessor :address

  def initialize(address)
    @address = address
  end

  def self.create(adress)
    @url = Url.new(adress)
  end

  def self.instance
    @url
  end
end
