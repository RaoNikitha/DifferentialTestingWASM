;; 2. **Test 2: Incorrect Condition Evaluation on Dynamic Comparison**    - Create a `br_if` instruction inside a block with a condition `i32.eq` (equality check) with inputs that are equal. Verify if the branch is wrongly not taken.    - **Constraint Checked**: Correctness of dynamic condition evaluation for equality checks.

(assert_invalid
  (module (func $incorrect-cond-eval
    (block (br_if 0 (i32.eq (i32.const 1) (i32.const 1))))
  ))
  "type mismatch"
)