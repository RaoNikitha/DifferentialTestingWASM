;; Test 1: Create a loop with a branching condition (`br_if`) that is always false, but the condition evaluation is dependent on correct label and operand stack handling.

(assert_invalid
  (module
    (func $branch_condition_invalid
      (loop $l (result i32)
        (i32.const 0)
        (br_if $l (f32.const 1.0))
      )
    )
  )
  "type mismatch"
)