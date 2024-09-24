;; - Test 4: Design a block with a `call` to a function that takes parameters and returns a value, but the blocktype does not match the function signature. This verifies if the block instruction properly validates the function signature against the blocktype.

(assert_invalid
 (module
  (type $func_type (func (param i32) (result i64)))
  (func $call_func (type $func_type) (param i32) (result i64) (i64.const 42))
  (func $block_test
   (block (result i32)
    (call $call_func (i32.const 0))
   )
  )
 )
 "type mismatch"
)