;; 10. Create a situation where a `call` instruction is interleaved with other stack operations (pushes and pops), ensuring that when an invalid function index is called, the stack remains consistent and no corruption occurs for valid subsequent operations.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 42)
      (call 999) 
      (i32.add)
    )
  )
  "invalid function index"
)