;; 1. **Test 1**: Create a loop that conditionally branches to an `unreachable` instruction using the `br_if` statement based on a value from the stack. Specifically, push a zero and branch with index 1 if zero. The branch should not be taken, and the loop should continue without hitting the `unreachable` instruction.

(assert_invalid
  (module
    (func $test-loop-br_if
      (loop
        (block
          (br_if 1 (i32.const 0))
          (unreachable)
        )
      )
    )
  )
  "unreachable"
)