all :
	rake build

other:
#	bundle install
#rake package
	gem build poise-boiler.gemspec
	gem install *.gem

