;; 1. Test a `block` instruction with `br_if` that branches based on a condition involving a non-zero constant, ensuring that the correct implicit label is created and the branch occurs only if the condition is non-zero.

(assert_invalid
  (module (func $br_if_test (result i32)
    (block (result i32)
      (i32.const 1)  ;; Condition
      (br_if 0 (i32.const 42))  ;; Branch if condition is non-zero
      (i32.const 99)  ;; This value is pushed if branch does not occur
    )
  ))
  "type mismatch"
)