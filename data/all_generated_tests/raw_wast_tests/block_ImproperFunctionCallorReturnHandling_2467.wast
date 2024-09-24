;; - Test 8: Create a block that calls a function that performs an invalid return (e.g., returning a type that does not match the block's `valtype?`), testing how the block instruction handles improper returns.

(assert_invalid
  (module
    (type $t (func (result i32)))
    (func $f (result i32) (return (f32.const 1.0)))
    (func (result i32)
      (block (result i32) (call $f))
    )
  )
  "type mismatch"
)