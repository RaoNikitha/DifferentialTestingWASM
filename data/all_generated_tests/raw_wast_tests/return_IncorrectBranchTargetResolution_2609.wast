;; - Put a function call inside a block where both the nested block and the function itself contain return instructions. Check if the inner block's return incorrectly targets the function call's block instead of terminating the function call or the outermost function.

(assert_invalid
 (module
  (func $nested-return (result i32)
   (block
    (call $inner-block)
    (return (i32.const 1))
   )
  )
  (func $inner-block
   (block
    (return)
   )
  )
 )
 "type mismatch"
)