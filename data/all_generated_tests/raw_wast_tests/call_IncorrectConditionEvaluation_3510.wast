;; - Create a function with no parameters that returns a multi-value result (e.g., two integers). Call this function and ensure the `call` instruction pops no arguments and correctly pushes the result types.

(assert_invalid
  (module
    (type $multiReturn (func (result i32 i32)))
    (func $multiFunc (type $multiReturn) (i32.const 1) (i32.const 2))
    (func (call $multiFunc))
  )
  "type mismatch"
)