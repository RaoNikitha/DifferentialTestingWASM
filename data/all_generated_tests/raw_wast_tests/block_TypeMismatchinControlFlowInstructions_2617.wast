;; 8. **Incorrect Parameter Passing**: Define a function that takes a parameter of type `i32` and within the function, a `block` expects an `f64`. Call the function with `i32`, testing if the block's execution context correctly handle parameter type mismatches.

(assert_invalid
  (module
    (func $type-block-param-mismatch (param i32) (result f64)
      (block (result f64)
        (f64.add (local.get 0) (f64.const 0.0))
      )
    )
  )
  "type mismatch"
)