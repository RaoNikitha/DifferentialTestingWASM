;; - **Test 1**:    Create a loop instruction with a condition that always evaluates to true (e.g., continuously check if 1 is equal to 1). This will help determine if both implementations handle infinite loops that do not have an exit condition.     Constraint: Evaluates `br_if` always true.     Relation: The loop will never exit, creating an infinite loop.

(assert_invalid
  (module
    (func (loop (result i32)
      (br_if 0 (i32.const 1))
    )))
  "infinite loop"
)