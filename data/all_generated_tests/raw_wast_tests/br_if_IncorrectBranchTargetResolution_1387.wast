;; 8. Design a `br_if` where the conditional check attempts to jump to a label in an outer scope but due to incorrect index, it should fail and continue execution within the current scope, testing stack height and operand validation.

(assert_invalid
  (module (func (result i32)
    (block (block (result i32) (br_if 2 (i32.const 1))))
    (i32.const 0)
  ))
  "unknown label"
)