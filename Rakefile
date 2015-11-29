# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks


desc "Update all profiles"
task update_profiles: :environment do
  puts "Updating all profiles"
  ProfileUpdater.update_all
  puts "Done updating all profiles"
end
