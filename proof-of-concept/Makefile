.PHONY: run
run: dependencies
	bundle exec ruby optome.rb

.PHONY: dependencies
dependencies: tesseract_os_x
	bundle

.PHONY: clean
clean:
	git clean -f

.PHONY: tesseract_os_x
tesseract_os_x:
	brew install tesseract
