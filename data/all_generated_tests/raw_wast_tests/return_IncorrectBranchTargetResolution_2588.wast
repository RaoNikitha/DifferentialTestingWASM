;; 7. **Test with Non-Matching Outer Block Returns**    - **Description**: Have a function where the outer block requires a specific return type, but use `return` inside nested blocks with different contexts.    - **Constraint**: Verify that the nested `return` instructions resolve correctly to the outer block's requirements.

(assert_invalid
  (module
    (func $type-value-non-matching-outer (result i32)
      (block (result i32)
        (loop
          (block
            (return (f64.const 1.0))
          )
        )
      )
    )
  )
  "type mismatch"
)