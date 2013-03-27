desc "Pivotal Tracker"

  task :fetch_stories => :environment do
    puts "Setting token"
    PivotalTracker::Client.token = '7359568a48cabd658d883d5993365410'
    puts "Collecting all projects"
    @project = PivotalTracker::Project.find(783957)
    @stories = @project.stories.all
    @stories.each do |s|
      puts s.inspect
    end

end
