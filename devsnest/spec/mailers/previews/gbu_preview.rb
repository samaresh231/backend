# Preview all emails at http://localhost:3000/rails/mailers/gbu
class GbuPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/gbu/reminder
  def reminder
    GbuMailer.reminder
  end

end
