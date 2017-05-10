# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

namespace :stats do
  desc "未ツイート件数を表示"
  task tweet: :environment do
    puts "Untweeted count: "
    Account.all.each do |account|
      puts "#{account.name}: #{account.account_rss_items.where("account_rss_items.tweeted_date": nil).count}"
    end
  end
end

namespace :deploy do
  desc "deploy to server and restart service with migrating and precomiling"
  task :all do
    remote_cmds = [
      "git pull",
      "bundle",
      "RAILS_ENV=production bundle exec rake db:migrate",
      "RAILS_ENV=production bundle exec rake assets:precompile",
      "passenger-config restart-app ."
    ]
    ssh_excutes(remote_cmds)
  end

  desc "deploy to server and restart service"
  task :simple do
    remote_cmds = [
      "git pull",
      "passenger-config restart-app ."
    ]
    ssh_excutes(remote_cmds)
  end
end

namespace :remote do
  namespace :stats do
    desc "サーバーの未ツイート件数を表示"
    task tweet: :environment do
      remote_cmds = [
        "RAILS_ENV=production bundle exec rake stats:tweet"
      ]
      ssh_excutes(remote_cmds)
    end
  end
end

def ssh_excutes(cmds)
  default_cmd = "cd work/rails/bots"
  cmds.unshift(default_cmd)
  sh "ssh sakura '#{cmds.join(" && ")}'"
end
