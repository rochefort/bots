# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

desc "未ツイート件数を表示"
namespace :stats do
  task tweet: :environment do
    puts "Untweeted count: "
    Account.all.each do |account|
      puts "#{account.name}: #{account.account_rss_items.where("account_rss_items.tweeted_date": nil).count}"
    end
  end
end
