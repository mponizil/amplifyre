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
band_site = user.band_sites.create({ :slug => 'bringtheloot', :name => 'The Loot', :description => 'NYC Jazz Hip-Hop Collective', :title => 'The Loot', :phrase => 'pumpin sweet beats', :desat => '6-1317341185-bw.jpg', :sat => '6-1317341185-color.jpg' })
news_page = band_site.pages.create({ :order => 1, :category => 'news', :slug => 'news', :title => 'News' })
about_page = band_site.pages.create({ :order => 2, :category => 'custom', :slug => 'about', :title => 'About', :body => 'Sexy folk music on the Lower East Side.<br /> Featuring:<br /><br />Raveena Aurora<br />Minnie and Aya<br />Steady Sun<br />Eric Ching<br /><br />Culture Fix<br />9 Clinton Street<br />New York, NY 10002<br />(646) 863-7171<br />culturefixny.comSexy folk music on the Lower East Side.<br /> Featuring:<br /><br />Raveena Aurora<br />Minnie and Aya<br />Steady Sun<br />Eric Ching<br /><br />Culture Fix<br />9 Clinton Street<br />New York, NY 10002<br />(646) 863-7171<br />culturefixny.comSexy folk music on the Lower East Side.<br /> Featuring:<br /><br />Raveena Aurora<br />Minnie and Aya<br />Steady Sun<br />Eric Ching<br /><br />Culture Fix<br />9 Clinton Street<br />New York, NY 10002<br />(646) 863-7171<br />culturefixny.comSexy folk music on the Lower East Side.<br /> Featuring:<br /><br />Raveena Aurora<br />Minnie and Aya<br />Steady Sun<br />Eric Ching<br /><br />Culture Fix<br />9 Clinton Street<br />New York, NY 10002<br />(646) 863-7171<br />culturefixny.comSexy folk music on the Lower East Side.<br /> Featuring:<br /><br />Raveena Aurora<br />Minnie and Aya<br />Steady Sun<br />Eric Ching<br /><br />Culture Fix<br />9 Clinton Street<br />New York, NY 10002<br />(646) 863-7171<br />culturefixny.com' })
photos_page = band_site.pages.create({ :order => 3, :category => 'photos', :slug => 'photos', :title => 'Photos' })
listen_page = band_site.pages.create({ :order => 4, :category => 'listen', :slug => 'listen', :title => 'Listen' })
tour_page = band_site.pages.create({ :order => 5, :category => 'tour', :slug => 'tour', :title => 'Tour' })
contact_page = band_site.pages.create({ :order => 6, :category => 'contact', :slug => 'contact', :title => 'Contact' })
album = band_site.albums.create({ :title => 'Episodes', :cover => '6-1313881677.jpg' })
track1 = album.tracks.create({ :title => 'The Gift Be', :file => '6-1313946157', :artist => 'The Loot' })
track2 = album.tracks.create({ :title => 'Come Clean', :file => '6-1313946195', :artist => 'The Loot' })
social = band_site.socials.create({ :category => 'facebook', :link => 'http://facebook.com/thelootnyc' })
concert = band_site.concerts.create({ :date => '10-03-2012', :venue => 'CultureFix', :details => 'Sexy folk music on the Lower East Side.<br /> Featuring:<br /><br />Raveena Aurora<br />Minnie and Aya<br />Steady Sun<br />Eric Ching<br /><br />Culture Fix<br />9 Clinton Street<br />New York, NY 10002<br />(646) 863-7171<br />culturefixny.com', :photo => '189-1329107550.jpg' })
post1 = band_site.posts.create({ :title => 'Thanks for coming out. We had a great time!', :body => 'Sullivan Hall was bumping Saturday night. Much love to Carlton &quot;Fred Hampton&quot; Tarantino for coming out from DC for the show and thank you all for coming to see us. For those who couldn&#39;t make it, you missed out, but we&#39;ve got recordings. Stay tuned.' })
post2 = band_site.posts.create({ :title => 'Episode EP', :body => '<div style="text-align:center;">Download the Episodes EP Now!<br /><a href="http://bringtheloot.com/download/Episodes%20EP.zip"><img src="http://i.imgur.com/ECEuu.jpg" /></a></div>' })
photo1 = band_site.photos.create({ :file => '6-1315856282.jpg' })
photo2 = band_site.photos.create({ :file => '6-1315856283.jpg' })
photo3 = band_site.photos.create({ :file => '6-1315856284.jpg' })
photo4 = band_site.photos.create({ :file => '6-1315856285.jpg' })
