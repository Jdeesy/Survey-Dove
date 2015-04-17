class User < ActiveRecord::Base
  has_many :created_surveys, class_name: "Survey", foreign_key: "creator_id"
  has_many :responses
  has_many :choices, through: :responses
  has_many :questions, through: :choices
  has_many :taken_surveys, through: :questions, source: :survey
end
