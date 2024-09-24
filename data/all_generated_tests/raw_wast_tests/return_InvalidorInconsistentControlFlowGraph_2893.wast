;; 2. **Unreachable Code after Return**:    Include instructions after a `return` in a function block.    - Verifies if the CFG correctly identifies and handles unreachable code post-return.

(assert_invalid
  (module
    (func $unreachable-code-after-return
      (i32.const 0)
      (return)
      (i32.const 1)  ;; This instruction should be unreachable
      (drop)
    )
  )
  "unreachable code"  ;; Intending to test proper handling of unreachable code
)