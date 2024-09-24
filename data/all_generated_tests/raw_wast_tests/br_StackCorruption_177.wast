;; 8. **Test Description:**    - Formulate a test with a complex and deeply nested control flow incorporating multiple `br` instructions targeting a mix of `if` and `block` constructs. Focus on ensuring that relative label indexing is correctly interpreted to prevent improper stack manipulations.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block 
          (block
            (br 2) 
          )
          (i32.const 1)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)