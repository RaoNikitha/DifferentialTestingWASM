;; 5. **Test Description**: Create a sequence with several `br_if` instructions each with a condition checking distinct variables. Ensure each condition is properly evaluated and only the appropriate branches are taken.    - **Constraint Checked**: Validates individual condition evaluation in `br_if` instructions.    - **Relation to Incorrect Evaluation**: Identifies if there is a systemic condition evaluation issue causing incorrect branching.

(assert_invalid
  (module (func $multiple-br_if (block (br_if 0 (i32.const 0)) (br_if 0 (i32.const 1)) (br_if 0 (i32.const 2)))))
  "type mismatch"
)