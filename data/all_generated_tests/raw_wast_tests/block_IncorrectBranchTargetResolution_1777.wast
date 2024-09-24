;; 8. **Deeply Nested Blocks with Immediate Branches**:    Design tests with deeply nested blocks that contain immediate `br` instructions to different nesting depths, ensuring labels are correctly indexed and branches resolve to the intended blocks.

(assert_invalid
  (module (func $deeply-nested-blocks-immediate-branches (result i32)
    (block (result i32)
      (block (result i32) 
        (block (result i32) 
          (br 2 (i32.const 1)) 
          (i32.const 2)
        )
        (i32.const 3)
      )
      (i32.const 4)
    )
  ))
  "type mismatch"
)