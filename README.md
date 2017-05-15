# Toy Robot Simulator

`Ruby 2.3.3`

## Introduction
This application simulates a toy robot moving on a 5 x 5 table.

```
-----------------------------------------
|       |       |       |       |       |
| (0,4) | (1,4) | (2,4) | (3,4) | (4,4) |
|       |       |       |       |       |
-----------------------------------------
|       |       |       |       |       |
| (0,3) | (1,3) | (2,3) | (3,3) | (4,3) |
|       |       |       |       |       |
-----------------------------------------
|       |       |       |       |       |
| (0,2) | (1,2) | (2,2) | (3,2) | (4,2) |
|       |       |       |       |       |
-----------------------------------------
|       |       |       |       |       |
| (0,1) | (1,1) | (2,1) | (3,1) | (4,1) |
|       |       |       |       |       |
-----------------------------------------
|       |       |       |       |       |
| (0,0) | (1,0) | (2,0) | (3,0) | (4,0) |
|       |       |       |       |       |
-----------------------------------------
```

## How to run the program
```
$ ruby main.rb
```

Commands are:
- `PLACE X,Y,F` &ndash; places a robot on the table at position X, Y facing the direction F
- `MOVE` &ndash; moves the robot forward one unit in the direction it is facing
- `LEFT` &ndash; turns the robot 90&deg; to the left
- `RIGHT` &ndash; turns the robot 90&deg; to the right
- `REPORT` &ndash; prints the position and direction of the robot to standard output

`MOVE`, `LEFT`, `RIGHT` and `REPORT` only take effect if there is a robot on the table.

Attempts to `PLACE` or `MOVE` a robot outside the table will be ignored.

More information can be found in **PROBLEM.md**.

To exit the program, press `CTRL` + `C`.

## How to run the tests
Tests require [rspec](https://github.com/rspec/rspec) and [rantly](https://github.com/rantly-rb/rantly). At time of writing, these can be installed with:

```
$ gem install rspec
$ gem install rantly
```

(If exact versions are needed, these tests were written with `rspec 3.6.0` and `rantly 1.1.0`)

Then, run

```
$ rspec
```

to run the tests.

## Design notes
The `play` method in the `Simulator` module is tail-recursive.

To take advantage of this, tail-call optimisation was enabled by adding the following lines to `main.rb`:

```ruby
RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}
```
