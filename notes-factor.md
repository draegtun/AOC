
# Initial
	
	* Started on and off end of 2022 and early 2023
	* Just first 5 days of tasks
	* All done in single module (file)
	* with single test file containing all example & input data
	* then stopped for a few months

# First refactor

	* Moved each day task into own module
	* Each task had its own example data test
	* New top level module (AOC2022.factor) containing helper words (functions)
	* And top level test-file (AOC2022-tests.factor) using (live) input-data
	* NB. One gain is that running AOC2022-tests.factor also run all day sub tests too :)
	* input-data/ folder created (so can keep outside of Git)
	* Used "resource:work/AdventOfCode/AOC2022/input-data" path

# Put into git and created Github repo

	* Github AOC repo designed for more languages than just Factor!
	* Symlinked factor code back to Factor's work folder
	* However Factor "refresh-all" (F2 in Repl) no longer saw updates :(
	* NB. so the io.listener doesn't seem to work with symlinks

# Second refactor 

	* So removed symlink and instead added code to .factor-roots
	* refactored AOC2022.factor
	* And changed to using path "vocab:AdventOfCode/..." instead of "work:..."

# Things learnt dueing second refactor

	* `dec>` in-place of `string->number` (just shorter not sure any other difference/benefit)
	* `map-sum` in-place of `map sum` (more efficient)
	* `sequence assoc substitute` - changes elemets a sequence using assoc/map/lookup
		- where assoc is (or can be)  { { this => to-this } { ... } }
	* `"A" first` returns ascii/unicode code of first char in string:  => 65
	
