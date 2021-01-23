namespace :import do
    desc "import contents from a csv file"
    require 'csv'
    task data: :environment do
        filename=File.join Rails.root, "scripts/data_content.csv"
        CSV.foreach(filename) do |row|
            topic = row[0]
            sub_topic= row[1]
            quest_link = row[2]
            Content.create(name: sub_topic, parent_id: topic, link: quest_link)
        end
        
        res = Content.all
        res.each do |item|
            ques_number = item.id
            ques_unique_id = "Q#{ques_number}"
            Content.update(item.id,unique_id: ques_unique_id)
            
        end
    end
end
# command to task  =>  rake import:data
