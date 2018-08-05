
final: server-base desktop-base desktop-customized

server-base:
	make -C fedora-server-base

desktop-base: server-base
	make -C fedora-desktop-base

desktop-customized: desktop-base
	make -C fedora-desktop-customized

.PHONY: final server-base desktop-base desktop-customized
