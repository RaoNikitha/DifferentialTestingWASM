;; **Test 10**: Construct a scenario with a complex sequence of instructions, including loops, conditions, and a function call that eventually leads to a `return`. Place an `unreachable` at the end of this sequence. Proper handling of all control structures should prevent `unreachable` from executing. *Constraint Checking*: Ensures comprehensive control flow correctness and `return` handling in complex sequences.  These tests focus on ensuring that when a `return` is executed, the function appropriately terminates and does not erroneously continue to execute further, reaching an `unreachable` instruction.

(assert_invalid
  (module
    (func $complex-control-flow (result i32)
      (i32.const 0)
      (block (loop (if (then (br 1))))
      (return)
      (call $dummy))
      (unreachable)
    )
    (func $dummy)
  )
  "type mismatch"
)