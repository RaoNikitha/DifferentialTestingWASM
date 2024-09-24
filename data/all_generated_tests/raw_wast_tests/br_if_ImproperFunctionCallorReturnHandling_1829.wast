;; 10. Test conditional branching with `br_if` in a function returning early using `return`, ensuring that function return values and operand stacks are properly aligned if the branch is taken. This will identify handling discrepancies related to function call/return sequences in wizard_engine.

(assert_invalid
  (module (func (result i32) (block (i32.const 42) (return) (br_if 0 (i32.const 1)))))
  "type mismatch"
)