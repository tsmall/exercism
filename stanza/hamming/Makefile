LIBS = ../lib/tap.stanza

run-tests: test
	./test

test: $(LIBS) hamming.stanza test.stanza
	stanza $(LIBS) hamming.stanza test.stanza -o test

clean:
	rm -f test
