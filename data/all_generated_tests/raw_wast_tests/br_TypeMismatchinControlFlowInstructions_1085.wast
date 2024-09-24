;; 6. Construct a `block` where a `br` targets the end, but the operand stack has an extra unanticipated type (e.g., an additional `i32`). This will validate that the stack unwinding during the branch correctly accounts for expected operand types.

(assert_invalid
  (module
    (func (block (i32.const 1) (i32.const 2) (br 0)))
  )
  "type mismatch"
)