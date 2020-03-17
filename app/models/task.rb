# frozen_string_literal: true

# Class for handling tasks table
class Task < ApplicationRecord
  include StringEnum

  enum_init status: ['Done', 'Pending', 'On Going', 'On QA']

  belongs_to :project
  belongs_to :owner, class_name: 'User'

  accepts_nested_attributes_for :project
end
