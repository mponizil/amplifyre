require 'net/http'

namespace :big_assets do
  desc 'TODO'
  task :fetch => :environment do

    Net::HTTP.start('bringtheloot.com') do |http|
      mkdir_cmd = 'mkdir -p ' + Rails.root.join('public/assets/audio/track/file').to_s
      puts mkdir_cmd
      system mkdir_cmd

      puts 'Downloading "bringtheloot.com/mp3/0-1313374341.mp3" to "public/assets/audio/track/file/default.mp3" ...'
      file1 = open(Rails.root.join('public/assets/audio/track/file/default.mp3'), 'wb')

      http.request_get('/mp3/0-1313374341.mp3') do |response|
        response.read_body do |segment|
          file1.write(segment)
        end
      end
    end

    Net::HTTP.start('bringtheloot.com') do |http|
      mkdir_cmd = 'mkdir -p ' + Rails.root.join('db/seeds/audio/track').to_s
      puts mkdir_cmd
      system mkdir_cmd

      puts 'Downloading "bringtheloot.com/mp3/6-1313946157.mp3" to "db/seeds/audio/track/1313946157.mp3" ...'
      file2 = open(Rails.root.join('db/seeds/audio/track/1313946157.mp3'), 'wb')

      http.request_get('/mp3/6-1313946157.mp3') do |response|
        response.read_body do |segment|
          file2.write(segment)
        end
      end
    end

    Net::HTTP.start('bringtheloot.com') do |http|
      mkdir_cmd = 'mkdir -p ' + Rails.root.join('db/seeds/audio/track').to_s
      puts mkdir_cmd
      system mkdir_cmd

      puts 'Downloading "bringtheloot.com/mp3/6-1313946195.mp3" to "db/seeds/audio/track/1313946195.mp3" ...'
      file3 = open(Rails.root.join('db/seeds/audio/track/1313946195.mp3'), 'wb')

      http.request_get('/mp3/6-1313946195.mp3') do |response|
        response.read_body do |segment|
          file3.write(segment)
        end
      end
    end

  end

end
