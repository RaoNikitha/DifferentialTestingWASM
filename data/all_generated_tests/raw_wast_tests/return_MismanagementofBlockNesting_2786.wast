;; Test 5: Build a function containing nested blocks with `if-else` conditions that rely on previously pushed stack values. Use `return` to exit from within the `else` block under some conditions. Verify the stack unwinding and correct return when exiting multiple nested conditional branches.

(assert_invalid
  (module
    (func $nested-if-return (param i32) (result i32)
      (block (result i32)
        (i32.const 1)
        (if (param i32) (result i32)
          (then (i32.const 2))
          (else (block (return)))
        )
      )
    )
  )
  "type mismatch"
)