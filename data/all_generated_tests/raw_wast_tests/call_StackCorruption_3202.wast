;; 1. **Test Description**: Call a function with more arguments than expected. Check if the stack correctly handles the extra arguments by either raising an overflow error or managing the extra elements without corruption.    **Constraint Checked**: Argument stack management and overflow handling.    **Relation to Stack Corruption**: If the extra arguments corrupt the stack, subsequent instructions will operate on incorrect data.

(assert_invalid
  (module
    (func $type-extra-args (call 0 (i32.const 1) (i32.const 2)))
    (func (param i32))
  )
  "type mismatch"
)