;; 8. **Test Description**: Create multiple nested `loop` structures where an inner `br` incorrectly targets a non-loop block, i.e., not jumping backwards.    - **Constraint**: Verifies that `br` correctly differentiates between backward jumps to loops and forward branch logic.

(assert_invalid
  (module
    (func $incorrect-loop-target
      (block
        (loop
          (block (br 1))
        )
      )
    )
  )
  "unknown label"
)