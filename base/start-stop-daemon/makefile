CC = cc
CFLAGS += -g -Wall

PROGRAM = start-stop-daemon
SOURCES = start-stop-daemon.c

MANUAL = start-stop-daemon.8
POD = start-stop-daemon.pod

default: all

$(PROGRAM): $(SOURCES)
	$(CC) $(CFLAGS) -o $(@) $(SOURCES)

$(MANUAL): $(POD)
	pod2man --section=8 --center=' ' $(POD) $(@)

all: $(PROGRAM) $(MANUAL)
clean: ; rm -f $(PROGRAM) $(MANUAL)
patch: ; patch -p1 -i crux-patch.diff
force: clean all
