;; 5. **Test: `unreachable` in Recursion**    - **Goal:** Check CFG behavior in recursive function setups.    - **Description:** Define a recursive function where `unreachable` is invoked under certain conditions within the recursive loop. Confirm the trap occurs when conditions are met, and no further recursion or instructions are processed.    - **Constraint Checked:** CFG handling of recursion with `unreachable`.

(assert_invalid
  (module 
    (func $test
      (result i32)
      (call $recursive_fn (i32.const 0))
    )
    (func $recursive_fn
      (param i32)
      (result i32)
      (if (i32.eq (local.get 0) (i32.const 0))
        (then (return (i32.const 0)))
        (else (unreachable))
      )
    )
  )
  "type mismatch"
)