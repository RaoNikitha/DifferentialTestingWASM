;; 9. **Test with Maximum Depth Control Stack**:    Push labels continuously to create a maximum-depth control stack and use `br_table` to branch to the deepest label, verifying if both implementations accurately handle maximum depth without overflow errors.

(assert_invalid
 (module
  (func
   (block (loop (br_if 1 (i32.const 1)) (br_if 0 (i32.const 1))))
  )
 )
 "type mismatch"
)