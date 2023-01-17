# Define the names of all the binaries we want created
ALL=towers_c towers_s
# Tell make what to build if we just type `make`
all: $(ALL)


# The name before the : is the name of the rule, this should be the file created
# The files after the colon are the dependencies, Make will compare the
#   timestamps of the depedencies and the rule to determine if it needs to rebuild
# The things on the following lines are the actions to take to build the file
# $@ is the meta character that means "name of the rule"
# $^ is the meta character that means "all of the dependencies"
towers_c: towers.c
	gcc -o $@ $^ -Wall

towers_s: towers.s
	gcc -o $@ $^ -Wall

# This is telling make that we are making up a rule that doesn't have a file
# associated, we just want make to do some stuff for us
.PHONY: testit clean

# Run towers_c and pipe in 10 as input, same for towers_s, compare their outputs
testit:
	echo "10" | ./towers_c > towers_c.10.out
	echo "10" | ./towers_s > towers_s.10.out
	diff -s towers_c.10.out towers_s.10.out 

# Clean up after ourselves, don't check in binaries or output files to your repo!
clean:
	rm $(ALL) towers_c.10.out towers_s.10.out
