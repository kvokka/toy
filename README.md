[![Codacy Badge](https://api.codacy.com/project/badge/Grade/8dcb628f71d94581b309d71da473e992)](https://app.codacy.com/app/kvokka/toy?utm_source=github.com&utm_medium=referral&utm_content=kvokka/toy&utm_campaign=Badge_Grade_Dashboard)
[![Build Status](https://travis-ci.org/kvokka/toy.svg?branch=master)](https://travis-ci.org/kvokka/toy)
[![Maintainability](https://api.codeclimate.com/v1/badges/2d04cacf87448e9cba23/maintainability)](https://codeclimate.com/github/kvokka/toy/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2d04cacf87448e9cba23/test_coverage)](https://codeclimate.com/github/kvokka/toy/test_coverage)

## Description

The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
There are no other obstructions on the table surface. The robot is free to roam around the surface of the table,
but must be prevented from falling to destruction. Any movement that would result in the robot falling from the
table must be prevented, however further valid movement commands must still be allowed.

Create an application that can read in commands of the following form - `PLACE X,Y,F` `MOVE` `LEFT` `RIGHT`
`REPORT`

`PLACE` will put the toy robot on the table in position X,Y and facing `NORTH`, `SOUTH`, `EAST` or `WEST`. The
origin (0,0) can be considered to be the `SOUTH` `WEST` most corner.

The first valid command to the robot is a `PLACE` command, after that, any sequence of commands may be
issued, in any order, including another `PLACE` command. The application should discard all commands in the
sequence until a valid `PLACE` command has been executed.

`MOVE` will move the toy robot one unit forward in the direction it is currently facing. `LEFT` and `RIGHT` will
rotate the robot 90 degrees in the specified direction without changing the position of the robot.

`REPORT` will announce the X,Y and orientation of the robot.

A robot that is not on the table can choose to ignore the `MOVE`, `LEFT`, `RIGHT` and `REPORT` commands.

Provide test data to exercise the application.

Constraints: The toy robot must not fall off the table during movement. This also includes the initial placement
of the toy robot. Any move that would cause the robot to fall must be ignored.

Example Input and Output:
a) PLACE 0,0,NORTH MOVE REPORT Output: 0,1,NORTH
b) PLACE 0,0,NORTH LEFT REPORT Output: 0,0,WEST
c) PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT Output: 3,3,NORTH

Deliverables: The source files, the test data and any test code.

### Usage example

```
    bin/toy PLACE 0,0,NORTH MOVE REPORT
```

### License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

### Code of Conduct

Everyone interacting in the Toy project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/toy/blob/master/CODE_OF_CONDUCT.md).
