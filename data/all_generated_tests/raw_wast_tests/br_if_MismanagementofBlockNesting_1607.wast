;; 8. **Test 8**: Nest several conditional branches inside each other and use `br_if` to conditionally target different nesting levels based on stack conditions. This test checks if the correct branch is taken amidst complex nested conditions.

(assert_invalid
  (module 
    (func $nested-branches 
      (block 
        (block 
          (block 
            (block 
              (br_if 0 (i32.const 1) (i32.const 1))
              (br_if 1 (i32.const 0) (i32.const 1))
              (br_if 2 (i32.const 1) (i32.const 1))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)