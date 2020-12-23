

# every :sunday, :at => '12pm' do # Use any day of the week or :weekend, :weekday
#     runner "Task.do_something_great"
#   end
  
#   every '0 0 27-31 * *' do
#     command "echo 'you can use raw cron syntax too'"
#   end
  
every :day, :at => '04:37pm' do
    command "GbuMailer.reminder().deliver_now"
end

# GbuMailer.reminder().deliver_now