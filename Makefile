pkg :
	gem build poise-boiler.gemspec
	gem install --user-install *.gem
	bundle exec rake build

other:
#	bundle install
#rake package

