# frozen_string_literal: true

class REST::GlobalMuteWordSerializer < ActiveModel::Serializer
  attributes :id, :phrase

  def id
    object.id.to_s
  end
end
