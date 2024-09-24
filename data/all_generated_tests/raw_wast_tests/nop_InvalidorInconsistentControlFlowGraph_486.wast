;; 7. **Test with `nop` Inside a Function with Multiple Returns:**    - Position `nop` instructions in a function that contains multiple return points and validate that the CFG directs correctly to the return paths.    - **Constraint Tested:** Validates that `nop` does not alter paths to multiple return points in a function.

 ;; (module 
  (func $multi_return (result i32)
    (if (i32.const 1) 
      (then 
        (nop) 
        (return (i32.const 1))
      )
    )
    (return (i32.const 2))
  )
)