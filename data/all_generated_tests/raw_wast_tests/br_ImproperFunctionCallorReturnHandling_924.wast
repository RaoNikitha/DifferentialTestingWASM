;; 5. **Test Description:** Design a scenario where a `block` contains a `call` to a function returning multiple values followed by a `br` instruction targeting an outer block. Confirm if the returned values correctly populate the stack after the branch.

(assert_invalid
 (module
  (func $multi_value_return (result i32 i32)
   (i32.const 1) (i32.const 2)
  )
  (func $test
   (block
    (call $multi_value_return)
    (br 1)
   )
   (block)
  )
 )
 "type mismatch"
)