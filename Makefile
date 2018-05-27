.PHONY: all
.PHONY: build_cookies
.PHONY: install
.PHONY: uninstall

all: cookies animaljam symlinks

build_cookies: cookies symlinks

build_animaljam: animaljam symlinks

install: install_cookies install_animaljam

uninstall: uninstall_cookies uninstall_animaljam

cookies:
	mkdir -p dist/
	cd dist/ && \
		mkdir -p cookies/cursors/
	xcursorgen -p src/cookies/img/ src/cookies/config/default.conf dist/cookies/cursors/default
	xcursorgen -p src/cookies/img/ src/cookies/config/pointer.conf dist/cookies/cursors/pointer
	cp src/cookies/index.theme dist/cookies/index.theme

animaljam:
	mkdir -p dist/
	cd dist/ && \
		mkdir -p animaljam/cursors/
	xcursorgen -p src/animaljam/img/ src/animaljam/config/default.conf dist/animaljam/cursors/default
	xcursorgen -p src/animaljam/img/ src/animaljam/config/pointer.conf dist/animaljam/cursors/pointer
	cp src/animaljam/index.theme dist/animaljam/index.theme

symlinks:
	./build.sh

install_cookies:
	mkdir -p ~/.icons/
	cp -r dist/cookies/ ~/.icons/cookies/

install_animaljam:
	mkdir -p ~/.icons/
	cp -r dist/animaljam/ ~/.icons/animaljam/

uninstall_cookies:
	cd ~/.icons/ && \
		rm -rf cookies/

uninstall_animaljam:
	cd ~/.icons/ && \
		rm -rf animaljam/

clean_cookies:
	cd dist/ && \
		rm -rf cookies/

clean_animaljam:
	cd dist/ && \
		rm -rf animaljam/

clean:
	rm -rf dist/
