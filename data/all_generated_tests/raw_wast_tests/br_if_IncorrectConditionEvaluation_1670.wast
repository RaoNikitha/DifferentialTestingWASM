;; 1. A `br_if` instruction is used inside an `if` block, controlled by an `i32` constant zero, expecting not to branch. The test checks whether the implementation incorrectly takes the branch regardless of the condition.

(assert_invalid
  (module (func $br_if-cond-zero (block (result i32)
    (i32.const 42)
    (if (result i32) (i32.const 0) (then (br_if 0 (i32.const 0)))) (i32.const 1)
  )))
  "type mismatch"
)