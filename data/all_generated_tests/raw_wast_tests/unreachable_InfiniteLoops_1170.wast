;; 1. **Test Description:**    - Insert the `unreachable` instruction right after a `loop` with a conditional branch (`br_if`) that always evaluates to false. This tests if the implementation correctly traps and avoids an infinite loop.    - Constraint: Verifies that the unconditional trap behavior of `unreachable` interrupts the loop execution.    - Infinite Loop Relation: Ensures `unreachable` prevents the loop from running indefinitely by causing a trap.

(assert_invalid
  (module (func $loop-unconditional-trap
    (loop (br_if 0 (i32.const 0)) (unreachable) (br 0))
  ))
  "loop with unreachable causing an unconditional trap"
)