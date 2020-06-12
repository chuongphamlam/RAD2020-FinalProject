# frozen_string_literal: true

class ApplicationHash < ActiveHash::Base
  include ActiveHash::Associations

  class << self
    def names(ids = nil)
      return all.pluck(:name) unless ids

      find(ids).pluck(:name)
    end
  end
end
