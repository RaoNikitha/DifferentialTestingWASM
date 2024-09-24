;; 7. **Test Description**: Place `nop` instructions just before and just after `return` statements in functions, checking if function exits correctly.    **Constraint Checked**: `nop` doesn’t affect function return behavior.    **Relation to CFG**: Affirms function’s return paths aren’t disrupted, ensuring valid exit nodes.

(assert_invalid
  (module (func (result i32) (nop) (return (i32.const 42)) (nop)))
  "type mismatch"
)