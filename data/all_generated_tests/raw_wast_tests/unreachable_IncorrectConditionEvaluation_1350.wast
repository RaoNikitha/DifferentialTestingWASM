;; 1. Write a test where the `br_if` condition is evaluated with an `i32.eqz` instruction, followed by an `unreachable` instruction in the branch body. The test will check if the branch is incorrectly taken by observing if the `unreachable` trap is triggered.

(assert_invalid
  (module (func (block (br_if 0 (i32.eqz (i32.const 0))) (unreachable)))
  "unreachable executed"
))