# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every "15 * * * *" do
  runner "app/batch/rss_crawler.rb"
  runner "app/batch/rss_classication.rb"
end

every 12.minutes do
  runner "app/batch/rss_twitter.rb"
end

every 1.day, at: "3:00am" do
  runner "app/batch/amazon_crawler.rb"
end