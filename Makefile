all: seqdb

seqdb:
	go get -u github.com/crawl/go-sequell/cmd/seqdb

test: unit integration

unit:
	rspec spec
	prove t

integration:
	perl ./scripts/test-henzell.pl --fail-fast

rdoc:
	find src -name '*.rb' | xargs rdoc
