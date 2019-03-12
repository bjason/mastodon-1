# == Schema Information
#
# Table name: global_mute_words
#
#  id         :bigint(8)        not null, primary key
#  phrase     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GlobalMuteWord < ApplicationRecord
  validates :phrase, presence: true
end
