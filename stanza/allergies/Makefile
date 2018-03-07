LIBS = ../lib/tap.stanza

run-tests: test
	./test

test: $(LIBS) allergies.stanza test.stanza
	stanza $(LIBS) allergies.stanza test.stanza -o test

clean:
	rm -f test
