;; 1. **Test Name: Mismatched Operand Types on Loop Branch**    - Create a loop block that expects certain operand types, but use a `br` instruction with mismatched operand types targeting the loop. This checks for correct type matching enforcement.

(assert_invalid
  (module
    (func $type-mismatched-loop-branch
      (loop (result i32) (i32.const 0) (br 0 (i64.const 1)))
    )
  )
  "type mismatch"
)