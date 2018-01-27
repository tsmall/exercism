LIBS = ../lib/tap.stanza

run-tests: test
	./test

test: $(LIBS) hello.stanza test.stanza
	stanza $(LIBS) hello.stanza test.stanza -o test

clean:
	rm -f test
