md := $(wildcard journal/*.md)
html := $(patsubst %.md,%.html,$(md))

all : $(html)

$(html) : %.html : %.md
	@./mk.sh $^