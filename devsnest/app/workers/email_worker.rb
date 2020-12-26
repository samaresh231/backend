class EmailWorker
  include Sidekiq::Worker

  def perform   
    GbuMailer.send_request()
  end
end

job = Sidekiq::Cron::Job.new(name: 'email_job', cron: "30 04 * * sun", class: 'EmailWorker')

if job.valid?
  job.save
else
  puts job.errors
end
 

