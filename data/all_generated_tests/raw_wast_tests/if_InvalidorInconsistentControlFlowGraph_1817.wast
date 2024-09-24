;; 8. Design an edge case where an `if` condition ensures its `then` block is always reachable but includes nested invalid type-producing instructions causing CFG issues. Tests validation of nested control flows.

(assert_invalid
  (module
    (func $type-then-nested-invalid 
      (result i32)
      (if (result i32) 
        (i32.const 1) 
        (then 
          (if (result i64) 
            (i32.const 0) 
            (then (i64.const 1)) 
            (else (i32.const 2))
          )
        ) 
        (else (i32.const 3))
      )
    )
  )
  "type mismatch"
)