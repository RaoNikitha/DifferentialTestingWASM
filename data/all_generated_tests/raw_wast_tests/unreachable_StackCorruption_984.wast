;; 5. Create a sequence where multiple functions are called in succession. Insert an `unreachable` instruction inside one of these functions, followed by stack operations. Verify that the function call causing the trap does not affect subsequent function calls.

(assert_invalid
  (module
    (func $func1 (result i32)
      (unreachable) 
      (i32.const 0)
    )
    (func (call $func1) (call $func1))
  )
  "type mismatch"
)