;; 1. Test a function that returns an integer but includes a `block` that incorrectly pushes a float value onto the stack before the `return` instruction is called. This checks if the engine properly validates the stack against the function's return type.

(assert_invalid
  (module
    (func $type-value-int-vs-float (result i32)
      (i32.const 0) 
      (block (f32.const 0.0)) 
      (return)
    )
  )
  "type mismatch"
)