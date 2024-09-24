;; 6. **Override Inner Branch**: Create nested blocks where an inner block contains branches that conflict with the outer block's label scope. The outer block should not resolve these branches incorrectly. This ensures proper label scoping in `wizard_engine`.

(assert_invalid
  (module 
    (func $block-label-conflict
      (block (result i32)
        (block (result i32) 
          (br 1 (i32.const 1))) 
        (br 0 (i32.const 2))
      )
    )
  )
  "type mismatch"
)