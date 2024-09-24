;; - Test Description 8: Create a loop with `br_if` that relies on values being conditionally updated within the loop. Ensure proper increment and conditional checks determine when branching is to occur, verifying sequential and iterative condition evaluation.

(assert_invalid
  (module
    (func $loop-with-conditional-branch (result i32)
      (i32.const 0)
      (loop (result i32)
        (i32.const 1)
        (i32.add)
        (tee_local 0)
        (i32.const 10)
        (i32.lt_s)
        (br_if 0)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)