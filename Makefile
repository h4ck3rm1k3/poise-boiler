pkg :
	gem build poise-boiler.gemspec
	gem install --user-install *.gem
	rake build

other:
#	bundle install
#rake package

