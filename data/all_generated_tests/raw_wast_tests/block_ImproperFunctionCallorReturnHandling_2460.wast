;; - Test 1: Create a block that declares a type mismatch between the blocktype and the function call within the block. Use `call` to a function that returns a value inconsistent with the block's return type. This tests whether the parser correctly checks block type validity when invoking function calls.

(assert_invalid
  (module (func $test
    (block (result i32) (call 0))
  ) (func (result f64) (nop)))
  "type mismatch"
)