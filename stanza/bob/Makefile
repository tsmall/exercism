LIBS = ../lib/tap.stanza

run-tests: test
	./test

test: $(LIBS) bob.stanza test.stanza
	stanza $(LIBS) bob.stanza test.stanza -o test

clean:
	rm -f test
