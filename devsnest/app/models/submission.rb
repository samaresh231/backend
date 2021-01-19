# frozen_string_literal: true

class Submission < ApplicationRecord
  enum status: %i[done notdone doubt]
  has_one :content

  def self.report(days, userid)
    res =  Content.joins(:submission).where(submissions: { status: 1, user_id: userid })
    .where({ updated_at: (Date.today - days)..(Date.today) })
    .select(:parent_id).group(:parent_id).count
  end  
end



