all:
	mkdir cookies/
	cd cookies/ && \
		mkdir cursors/
	xcursorgen -p img/cookies/ cursors.conf cookies/cursors/right_ptr
	echo "[Icon Theme]" > cookies/cursor.theme
	echo "Name=cookies" >> cookies/cursor.theme
	cd cookies/cursors/ && \
		ln -s right_ptr arrow && \
		ln -s right_ptr draft_large && \
		ln -s right_ptr draft_small

install:
	mkdir -p ~/.icons/
	cp -r cookies/ ~/.icons/cookies/

uninstall:
	cd ~/.icons/ && \
		rm -rf cookies/

clean:
	rm -rf cookies/
