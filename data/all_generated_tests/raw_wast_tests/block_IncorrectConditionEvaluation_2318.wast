;; 9. Test a `block` where the `br_if` condition relies on a value produced by a nested operation within the block, ensuring the condition's evaluation is accurate and the branching behavior reflects this evaluation.

(assert_invalid
  (module (func $type-nested-br_if-eval (result i32)
    (block (result i32)
      (i32.const 1)
      (br_if 0 (i32.add (i32.const 1) (i32.const 2))))
  ))
  "type mismatch"
)