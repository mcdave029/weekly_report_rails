# frozen_string_literal: true

# Class for handling projects table
class Project < ApplicationRecord
  validates :name, presence: true
end
