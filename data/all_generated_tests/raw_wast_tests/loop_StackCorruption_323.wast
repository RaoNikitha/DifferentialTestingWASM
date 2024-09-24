;; 4. Use a loop containing a `br_if` instruction conditioned on the top of the stack value, altering the sequence of operations inside the loop. Ensure that stack unwinding and reinitializing correctly repositions the stack without causing corruption when the branch is taken.

(assert_invalid
  (module
    (func $test-loop-br_if
      (i32.const 0)
      (loop (result i32)
        (br_if 0 (i32.const 1))
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)