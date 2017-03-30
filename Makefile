
final: server-base desktop-base desktop-customized

server-base:
	make -C fedora-25-server-base

desktop-base: server-base
	make -C fedora-25-desktop-base

desktop-customized: desktop-base
	make -C fedora-25-desktop-customized

.PHONY: final server-base desktop-base desktop-customized
