# frozen_string_literal: true

class Submission < ApplicationRecord
  enum status: %i[done notdone doubt]
  has_one :content

  def self.user_report(days, user_id)
    total_ques = Content.where(data_type: 0).count

    res = Content.joins(:submission).where(submissions: { status: 0, user_id: user_id }, contents: { data_type: 0 })
    total_solved_ques = res.count

    res = res.where({ updated_at: (Date.today - days)..(Date.today) }) if days.to_i.positive?
    res = res.select(:parent_id).group(:parent_id).count

    res['total_ques'] = total_ques
    res['total_solved_ques'] = total_solved_ques

    res
  end
end
