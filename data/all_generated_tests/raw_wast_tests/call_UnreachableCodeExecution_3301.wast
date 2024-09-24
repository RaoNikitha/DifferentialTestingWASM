;; 10. **Test Description**: Test the function calls which have nested blocks where the inner block’s return type differs from the expected type in the function signature. Incorrect validation should lead to execution reaching an 'unreachable' due to mismatched block validation.

(assert_invalid
  (module
    (func $nested-block-type-mismatch
      (block (result i32) 
        (block (call 1 (i32.const 0)))
        (i32.const 1)
      )
    )
    (func (param i32) (result i32) (unreachable))
  )
  "type mismatch"
)