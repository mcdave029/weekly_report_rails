# frozen_string_literal: true

# Class for handling tasks table
class Task < ApplicationRecord
  belongs_to :project
  belongs_to :owner, class_name: 'User'

  accepts_nested_attributes_for :project
end
