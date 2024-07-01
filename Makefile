serve:
	bundle exec jekyll serve --livereload --unpublished

serve_published:
	bundle exec jekyll serve --livereload

post:
	bundle exec jekyll post "$(name)"
