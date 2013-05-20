require 'benchmark'

namespace :mongoid do 
  desc "benchmarks mongoid"
  task :benchmark => :environment do
    Benchmark.bm(25) do |x|
      x.report do 
        Rake::Task['jobs:workoff'].invoke
      end
    end
  end
end

namespace :mongoid do  
  desc "populates the database"
  task :populate => :environment do 
    Benchmark.bm(25) do |x|
      x.report do 
        100000.times do 
          name = Faker::Name.name
          content = Faker::Lorem.paragraph(3)
          Article.delay.create(:name => name, :content => content)
        end
      end
    end
  end
end