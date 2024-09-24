;; 3. **Test Nested If Conditions with br_if Targeting Outer Blocks**:     Define nested `if` statements and use `br_if` to exit to various outer blocks. This will validate if the `br_if` label indexing correctly refers to the intended nesting level and if it manages stack properly.

(assert_invalid 
  (module 
    (func $nested_if_br_if 
      (block 
        (if 
          (i32.const 1) 
          (then 
            (if 
              (i32.const 1) 
              (then 
                (br_if 1 (i32.const 1)) 
              )
            ) 
          ) 
        ) 
      )
    )
  ) 
  "unknown label"
)