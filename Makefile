
build_use_binary/mkalteriso/build/mkalteriso:
	@if [ -d build_use_binary/mkalteriso/build ];\
	then \
		:;\
	else \
		mkdir -p build_use_binary/mkalteriso/build ;\
	fi
	(cd build_use_binary/mkalteriso/build ; cmake -GNinja ../../../mkalteriso/ ; ninja -j4 )
install.tar.gz:build_use_binary/mkalteriso/build/mkalteriso
	./build.sh build_use_binary/mkalteriso/build/mkalteriso