# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    validates :color, inclusion: { in: %w(white black brown orange), 
        message: "%{value} is not a valid color"}

    validates :sex, inclusion: { in: %w(M F), 
        message: "%{value} is not a valid sex"}

    def age
        time_age_in_words(birth_date)
    end
end