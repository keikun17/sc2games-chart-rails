desc "This task is called by the heroku scheduler to update all profiles"
task update_profiles: :environment do
  puts "Scheduler running...."
  puts "Updating all profiles"
  ProfileUpdater.update_all
  puts "Done updating all profiles"
end
