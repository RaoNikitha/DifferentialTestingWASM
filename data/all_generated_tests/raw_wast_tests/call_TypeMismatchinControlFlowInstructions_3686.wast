;; 5. **Test Description**: Use a `br` (branch) instruction inside a loop to call a function that returns a type different from what the loop expects on branch return.    - **Constraint**: This test checks if the type system correctly enforces type constraints for `br` instructions and function calls within loops.    - **Type Mismatch in Control Flow**: If the branch return type does not match, this will lead to a type mismatch and error on loop completion.

(assert_invalid
  (module
    (func $type-mismatch-loop
      (loop $loop
        (br_if $loop (i32.eqz (call 0))) ;; Incorrect return type from call
      )
    )
    (func (result i64)) ;; Function returns i64 which is not expected in loop
  )
  "type mismatch"
)