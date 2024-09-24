;; Test 6: Follow a `nop` with a series of stack-altering operations inside a `block` with an expected return type of `i32`. Ensure the operations yield a different type; validate if the block handles type expectations correctly.

(assert_invalid
  (module
    (func (block (result i32) (nop) (f32.const 1.0) (drop)))
  )
  "type mismatch"
)