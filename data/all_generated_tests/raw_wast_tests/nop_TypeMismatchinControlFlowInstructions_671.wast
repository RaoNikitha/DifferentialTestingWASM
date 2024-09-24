;; 2. **Nested `nop` instructions with mismatched loop and block result types**:    Place several `nop` instructions within a nested structure of loops and blocks where the outer block expects a result type that the inner constructs do not provide.    This tests the nested control flow type validation, ensuring the `nop` does not incorrectly satisfy type requirements.

(assert_invalid
  (module
    (func $nested-nop (result i32)
      (block (result i32)
        (loop
          (block
            (nop)
            (nop)
            (br 1)
          )
        )
      )
    )
  )
  "type mismatch"
)