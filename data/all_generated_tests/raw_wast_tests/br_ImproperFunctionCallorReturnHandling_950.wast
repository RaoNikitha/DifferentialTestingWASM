;; 1. **Test 1: Function Call with Incorrect Return Type after `br` Instruction**    - **Description:** This test calls a function within a `block` whose return type does not match the expected stack state after a `br` instruction. Verify if it leads to an incorrect stack state upon returning.    - **Reasoning:** This checks if the `br` instruction correctly handles stack changes before a function call, ensuring mismatched return types are caught.

(assert_invalid
  (module
    (func $test_func (result i32)
      (block (result i32) 
        (br 0) 
        (call $some_func) 
      )
      (i32.const 0)
    )
    (func $some_func (result f32)
      (f32.const 0.0)
    )
  )
  "type mismatch"
)