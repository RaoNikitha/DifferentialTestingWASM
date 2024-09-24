;; 4. **Cross-Nested Loops and Blocks**: Establish a test with interleaved loops and blocks where `call` instructions are placed within the innermost structures. The goal is to see if the control flow correctly exits each respective loop or block after the function has returned.

(assert_invalid
  (module
    (func $cross-nested
      (loop (block (call $nested-func (i32.const 0)) (br 1)) (br 0))
    )
    (func $nested-func (param i32) (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)