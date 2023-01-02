test:
	bundle exec rspec

logs-test:
	tail -f log/test.log

clean-logs:
	@rm -rf log/test.log
	@touch log/test.log

ping:
	@curl localhost:3000/health | jq .

cache:
	rails dev:cache
