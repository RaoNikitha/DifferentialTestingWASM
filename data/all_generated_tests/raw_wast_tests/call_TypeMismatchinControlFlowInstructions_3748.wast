;; 7. **Type Mismatch with Local Variables in Loop**:    Create a loop that initializes local variables of type `i64` but calls functions within the loop that return `i32`. Verify if local variable type consistency within the loop is maintained.

(assert_invalid
  (module
    (func $type-mismatch-loop 
      (local i64) 
      (loop 
        (call 1) 
      )
    )
    (func (result i32))
  )
  "type mismatch"
)