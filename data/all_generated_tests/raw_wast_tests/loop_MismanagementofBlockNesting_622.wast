;; 3. **Backward Branch After Nested Loops**: Implement a nested loop structure where an instruction in the outer loop causes a backward branch (`br`) that jumps to the start of the outer loop. This ensures the outer loop reinitializes correctly and checks for proper stack unwinding up to the correct height.

(assert_invalid
  (module (func $nested-loops-backward-branch
    (loop $outer (result i32)
      (i32.const 1)
      (loop $inner (result i32)
        (i32.const 2)
        br $outer
      )
      drop
    )
  ))
  "type mismatch"
)