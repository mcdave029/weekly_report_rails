# frozen_string_literal: true

# Class for handling users table
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable,
  # :trackable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable
end
