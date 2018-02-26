LIBS = ../lib/tap.stanza

run-tests: test
	./test

test: $(LIBS) binary.stanza test.stanza
	stanza $(LIBS) binary.stanza test.stanza -o test

clean:
	rm -f test
