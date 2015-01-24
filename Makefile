README.html: README.md
	markdown $^ > $@

clean:
	rm -Rf README.html *~ 
