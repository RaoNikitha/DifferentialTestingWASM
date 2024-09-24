;; 3. **Test 3**: Create a nested `block` where the inner block expects an `i32` result, but the outer block expects an `i64`. Use instructions that fulfill the inner block’s requirement but not the outer block’s. This tests multi-level type checking in nested blocks.

(assert_invalid
  (module (func $nested-block-type-mismatch
    (block (result i64)
      (block (result i32)
        (i32.const 0)
      )
      (i64.const 0)
    )
  ))
  "type mismatch"
)