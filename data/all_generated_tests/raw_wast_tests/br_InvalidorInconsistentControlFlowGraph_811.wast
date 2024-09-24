;; 2. **Test Description**: Utilize an `if` construct inside a `loop` that contains a `br 1`. The goal is to verify proper handling of conditional branches that target outer loops.    - **Constraint**: Checks whether conditional branches inside loops are correctly interpreting label indices and not misaligning the CFG.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (if (result i32)
          (then (br 1))
          (else (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)