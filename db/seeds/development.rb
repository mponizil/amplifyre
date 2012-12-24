# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# Read about fixtures at http://api.rubyonrails.org/classes/ActiveRecord/Fixtures.html

AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
user = User.create({ :email => 'misha.ponizil@gmail.com', :password => 'password' })

band_site = user.band_sites.create({ :slug => 'bringtheloot', :name => 'The Loot', :description => 'NYC Jazz Hip-Hop Collective', :title => 'The Loot', :phrase => 'pumpin sweet beats', :background_file => File.open('db/seeds/images/background/1317341185.jpg') })

# Destroy all default pages
band_site.pages.destroy_all

news_page = band_site.pages.create({ :category => 'news', :slug => 'news', :title => 'News' })
about_page = band_site.pages.create({ :category => 'custom', :slug => 'about', :title => 'About', :body => 'Sexy folk music on the Lower East Side.<br /> Featuring:<br /><br />Raveena Aurora<br />Minnie and Aya<br />Steady Sun<br />Eric Ching<br /><br />Culture Fix<br />9 Clinton Street<br />New York, NY 10002<br />(646) 863-7171<br />culturefixny.com' })
photos_page = band_site.pages.create({ :category => 'photos', :slug => 'photos', :title => 'Photos' })
listen_page = band_site.pages.create({ :category => 'listen', :slug => 'listen', :title => 'Listen' })
tour_page = band_site.pages.create({ :category => 'tour', :slug => 'tour', :title => 'Tour' })
contact_page = band_site.pages.create({ :category => 'contact', :slug => 'contact', :title => 'Contact' })

album = band_site.albums.create({ :title => 'Episodes', :cover_file => File.open('db/seeds/images/album/1313881677.jpg') })

# Destroy all default tracks
band_site.tracks.destroy_all

track1 = band_site.tracks.create({ :album_id => 1, :title => 'The Gift Be', :file => File.open('db/seeds/audio/track/1313946157.mp3'), :artist => 'The Loot' })
track2 = band_site.tracks.create({ :album_id => 1, :title => 'Come Clean', :file => File.open('db/seeds/audio/track/1313946195.mp3'), :artist => 'The Loot' })

social = band_site.socials.create({ :category => 'facebook', :link => 'http://facebook.com/thelootnyc' })

concert = band_site.concerts.create({ :date => '10-03-2012', :venue => 'CultureFix', :details => 'Sexy folk music on the Lower East Side.<br /> Featuring:<br /><br />Raveena Aurora<br />Minnie and Aya<br />Steady Sun<br />Eric Ching<br /><br />Culture Fix<br />9 Clinton Street<br />New York, NY 10002<br />(646) 863-7171<br />culturefixny.com', :photo_file => File.open('db/seeds/images/concert/1329107550.jpg') })

post1 = band_site.posts.create({ :title => 'Thanks for coming out. We had a great time!', :body => 'Sullivan Hall was bumping Saturday night. Much love to Carlton &quot;Fred Hampton&quot; Tarantino for coming out from DC for the show and thank you all for coming to see us. For those who couldn&#39;t make it, you missed out, but we&#39;ve got recordings. Stay tuned.' })
post2 = band_site.posts.create({ :title => 'Episode EP', :body => '<div style="text-align:center;">Download the Episodes EP Now!<br /><a href="http://bringtheloot.com/download/Episodes%20EP.zip"><img src="http://i.imgur.com/ECEuu.jpg" /></a></div>' })

photo1 = band_site.photos.create({ :file => File.open('db/seeds/images/photo/1315856282.jpg') })
photo2 = band_site.photos.create({ :file => File.open('db/seeds/images/photo/1315856283.jpg') })
photo3 = band_site.photos.create({ :file => File.open('db/seeds/images/photo/1315856284.jpg') })
photo4 = band_site.photos.create({ :file => File.open('db/seeds/images/photo/1315856285.jpg') })
