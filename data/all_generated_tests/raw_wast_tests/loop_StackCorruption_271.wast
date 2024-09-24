;; 2. Implement a nested `loop` where an inner loop modifies a stack value, and the outer loop performs conditional checks based on the inner loop's results. Ensure the correct operation of the inner loop without stack corruption affecting outer loop operations.

(assert_invalid
  (module 
    (func $nested_loop 
      (result i32) 
      (i32.const 0) 
      (loop $outer (result i32) 
        (loop $inner (result i32) 
          (i32.const 1) 
          (br $inner)
        )
        (i32.const 2)
        (br_if $outer (i32.eqz (i32.const 0)))
      )
    )
  )
  "type mismatch"
)