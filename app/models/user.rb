# frozen_string_literal: true

# Class for handling users table
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable,
  # :trackable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable

  has_many :tasks, foreign_key: :owner_id, dependent: :destroy
end
