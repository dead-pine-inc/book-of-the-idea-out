default:
	latexmk -pdf book_of_the_idea_out

clean:
	latexmk -C book_of_the_idea_out
	rm *.aux
