;; 4. **Function with Conditional Returns**:    Define a function that includes multiple conditional branches, each returning different types of values, and ensure an indirect call to it maintains the correct stack state and return type.

(assert_invalid
  (module
    (func (result i32)
      (if (i32.const 1) 
        (then (return (i32.const 42)))
        (else (return (f64.const 0.0)))
      )
    )
  )
  "type mismatch"
)