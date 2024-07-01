serve:
	bundle exec jekyll serve --livereload --unpublished

serve_published:
	bundle exec jekyll serve --livereload

blog:
	bundle exec jekyll compose "$(name)" --layout single --collection posts
