;; 1. **Nested Loop Condition Mismanagement**: Create a test with `call` instructions placed within nested loops, where an inner loop contains a `br_table` pointing to various depths. Ensure that function calls are made within the inner loop and verify if the break conditions exit the correct loop depending on the depth value.

(assert_invalid
  (module
    (func $nested-loops-calls
      (loop $outer
        (loop $inner
          (i32.const 1)
          (br_table 0 1 2)
          (call 1)
        )
      )
    )
    (func (param i32))
  )
  "unreachable code"
)