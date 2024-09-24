;; 6. Establish a module consisting of deeply nested if-else blocks with multiple `call_indirect` instructions that reference various valid and invalid function types. Verify that both implementations properly trap or proceed based on depth context.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $func1 (param i32) (result i32) (i32.const 42))
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $test-func
      (if (i32.const 1) 
        (then 
          (call_indirect (type $sig) (i32.const 0)) 
          (if (i32.const 0) 
            (then 
              (call_indirect (type $sig) (i32.const 1)) 
            ) 
            (else 
              (call_indirect (type 1) (i32.const 2)) 
            )
          )
        ) 
        (else 
          (call_indirect (type $sig) (i32.const 3)) 
        )
      )
    )
  )
  "unexpected type"
)