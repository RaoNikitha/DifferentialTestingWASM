;; 1. **Test 1: Incorrect Condition Evaluation on Static Boolean Value**    - Create a `br_if` instruction with a simple condition of `i32.const 1` (representing `true`) targeting an outer block. Check if the branch is wrongly not taken due to incorrect condition evaluation.    - **Constraint Checked**: Validity of condition evaluation for a static constant true value.

(assert_invalid
  (module
    (func $invalid-br_if-true
      (block $outer
        (block
          (br_if 1 (i32.const 1))  ;; Branch with condition i32.const 1
        )
      )
    )
  )
  "type mismatch"
)