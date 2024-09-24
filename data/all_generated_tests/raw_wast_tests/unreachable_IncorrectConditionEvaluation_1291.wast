;; 2. Test a nested conditional branch, where the inner branch contains an `unreachable` instruction. Check for execution flow correctness. Constraint: Validates nested branching logic and trap initiation. Example: `(i32.const 1) (if (then (i32.const 1) (br_if 0 (unreachable))))`

(assert_invalid
  (module (func $nested_conditional_with_unreachable
    (i32.const 1) (if (then (i32.const 1) (br_if 0 (unreachable))))
  ))
  "type mismatch"
)