;; 9. **Test Case**: Use a loop that calls a function which performs another loop internally, all iterations should ensure correct execution context for returns.    - **Constraint Check**: Ensure that nested loops within function calls maintain context integrity.    - **Improper Function Call or Return Handling**: Faulty return context causing outer loop to behave unexpectedly.

(assert_invalid
  (module 
    (type $sig (func (param i32) (result i32)))
    (func $inner (param i32) (result i32)
      (i32.const 0) (loop (param i32) (local.get 0) (br_if 0 (i32.eqz (local.get 0))))
    )
    (func $outer 
      (i32.const 1) 
      (loop (param i32)
        (call $inner (local.get 0)) 
        (drop)
      )
    )
  )
  "type mismatch"
)