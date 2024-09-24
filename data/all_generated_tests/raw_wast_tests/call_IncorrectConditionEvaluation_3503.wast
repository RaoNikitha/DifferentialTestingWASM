;; - Create a function that returns a constant value, say 42. Use the `call` instruction to invoke this function from another function and check the handling of return values to ensure no extra items are left on the stack.

(assert_invalid
  (module
    (func $return-42 (result i32) (i32.const 42))
    (func (param i32) (result i32)
    	(call $return-42)
    	(i32.add (i32.const 1))
    )
  )
  "type mismatch"
)