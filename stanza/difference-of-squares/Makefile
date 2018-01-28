LIBS = ../lib/tap.stanza

run-tests: test
	./test

test: $(LIBS) difference.stanza test.stanza
	stanza $(LIBS) difference.stanza test.stanza -o test

clean:
	rm -f test
