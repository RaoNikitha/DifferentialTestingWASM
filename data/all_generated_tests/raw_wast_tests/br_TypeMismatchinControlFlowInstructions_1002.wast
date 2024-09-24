;; 3. **Testing Nested Block with Varying Types:**    - Create nested `block` constructs where the inner block returns an `i32` and the outer block expects a `f64`. Insert a `br 1` instruction to branch out from the inner block to the outer block. The test ensures the correct handling of type consistency across nested constructs.

(assert_invalid
  (module
    (func $nested-block-type-test
      (block (result f64)
        (block (result i32)
          (i32.const 42)
          (br 1)
        )
        (f64.const 0.0)
      )
    )
  )
  "type mismatch"
)