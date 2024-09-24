;; - Create an `if` block where the condition depends on the outcome of a function call, ensuring that condition evaluation after function result correctly leads to the proper branch.

(assert_invalid
  (module 
    (func $test_func (result i32)
      (i32.const 5)
    )
    (func $conditional_branch 
      (if (result i32) 
        (call $test_func)
        (then (i32.const 6))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)