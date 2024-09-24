;; 9. **Complex Nesting with Intermixed `if` Statements**:    - Design nested `block` instructions intermixed with `if` statements containing `br_if`/`br` instructions. Check that correct block nesting and conditional branching ensure proper control flow. Errors in nested block management may result in skipping or incorrectly executing nested blocks and conditions.

(assert_invalid
  (module
    (func $complex-nesting-with-if (result i32)
      (block (result i32)
        (i32.const 1)
        (if (result i32)
          (then
            (block (result i32)
              (br_if 0 (i32.const 0)) 
              (i32.const 2)
            )
          )
          (else
            (i32.const 3)
          )
        )
      )
    )
  )
  "type mismatch"
)