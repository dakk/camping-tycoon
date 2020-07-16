all:
	dune build @install

test:
	dune build @runtest

clean:
	rm -rf _build


.PHONY : pin
pin: 
   	opam pin add camping-tycoon . -n && opam remove camping-tycoon && opam install camping-tycoon
