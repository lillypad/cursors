.PHONY: all
.PHONY: build_cookies
.PHONY: install
.PHONY: uninstall

all: cookies symlinks

build_cookies: cookies symlinks

install: install_cookies

uninstall: uninstall_cookies

cookies:
	mkdir dist/
	cd dist/ && \
		mkdir -p cookies/cursors/
	xcursorgen -p src/cookies/img/ src/cookies/config/default.conf dist/cookies/cursors/default
	xcursorgen -p src/cookies/img/ src/cookies/config/pointer.conf dist/cookies/cursors/pointer
	cp src/cookies/index.theme dist/cookies/index.theme

symlinks:
	./build.sh

install_cookies:
	mkdir -p ~/.icons/
	cp -r dist/cookies/ ~/.icons/cookies/

uninstall_cookies:
	cd ~/.icons/ && \
		rm -rf cookies/

clean_cookies:
	cd dist/ && \
		rm -rf cookies/

clean:
	rm -rf dist/
