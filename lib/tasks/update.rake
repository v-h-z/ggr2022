namespace :positions do
  desc 'force update positions for all races'
  task :update => :environment do
    Race.all.each do |race|
      PositionsUpdate.new(race).call
    end
  end
end
