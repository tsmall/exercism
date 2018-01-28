LIBS = ../lib/tap.stanza

run-tests: test
	./test

test: $(LIBS) pangram.stanza test.stanza
	stanza $(LIBS) pangram.stanza test.stanza -o test

clean:
	rm -f test
