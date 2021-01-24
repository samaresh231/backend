class Groupcall < ApplicationRecord
  enum choice: %i[no yes]
  has_one :user

  def self.add_meeting(user_id, choice)
    week = Date.current.cweek
    year = Date.current.year
    meeting = Groupcall.find_or_create_by(user_id: user_id, week: week, year: year)
    meeting.choice = choice
    meeting.save
    meeting
  end

  def self.fetch_groups
    week = Date.current.cweek
    year = Date.current.year

    count = -1
    groups = []
    cur_group = []

    Groupcall.where(choice: 'yes', week: week, year: year).each do |gc|
      gc.update(group_id: count)
      count += 1
      count = count%4
      if count == 0
        groups.append(cur_group) if cur_group != []
        cur_group = []
      end
      discord_id = User.find_by(id:gc.user_id).discord_id
      cur_group.append({ user_id: gc.user_id, discord_id: discord_id })
    end
    groups.append(cur_group)
    return groups
  end
end
