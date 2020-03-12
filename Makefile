.PHONY:all aec clean
r=$(PWD)

all clean:
	if [ "$@" == "clean" ];then\
		rm lib/* -f;\
	fi
	for i in `find src -name "Makefile"|sed 's/Makefile//g'`;do\
		$(MAKE) -C $$i r=$r $@ || exit 1;\
	done

aec:
		$(MAKE) -C test/ r=$r $@ || exit 1;\
