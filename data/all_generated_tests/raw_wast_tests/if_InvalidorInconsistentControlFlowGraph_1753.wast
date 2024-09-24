;; 4. **Test `if` Block Inside a Loop with Early Exit**:    - Create an `if` block inside a loop where a branch triggers an early exit from the loop, ensuring the CFG accurately reflects this exit.    - **Constraint Checked**: tests CFG’s handling of nested loops with early exits via branches.

(assert_invalid
  (module
    (func $nested-loop-if (result i32)
      (i32.const 100)
      (loop (result i32)
        (i32.const 1)
        (i32.eqz)
        (if (result i32)
          (then
            (br 1)
            (i32.const 1)
          )
          (else
            (i32.const 0)
          )
        )
      )
    )
  )
  "unreachable code"
)