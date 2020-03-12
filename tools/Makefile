LOCAL_PATH=$(notdir $(shell pwd))
CFILES=$(shell find ./ -maxdepth 1 -name "*.c")
CXXFILES=$(shell find ./ -maxdepth 1 -name "*.cc")
OBJS = $(CFILES:%.c=%.o) $(CXXFILES:%.cc=%.o)

.PHONY:all clean


ifneq ($(OBJS),)
OBJ=$r/lib/lib$(LOCAL_PATH).a
all:$(OBJ)

$(OBJ):$(OBJS)
	ar -r $@ $^

include $r/tools/Makefile.rule
-include $(OBJS:%.o=%.d)
-include $(OBJS:%.o=%.d)
else
	$(error 该目录下没有文件可以生成.o)
endif
