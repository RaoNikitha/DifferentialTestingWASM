;; 1. Import a function from another module that returns a value, and within an `if` block, conditionally call this function. Verify if the value correctly propagates back to the caller module based on the condition.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $conditional_call (result i32)
      (i32.const 1)
      (if (result i32) 
        (then (call $external_func)) 
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)