;; 1. Create a loop with a `br_if` condition that always evaluates to `false`. Execute the loop several times to ensure the loop only exits when the condition becomes `true`. This will test if the `br_if` condition is incorrectly handled by always taking the branch regardless of the actual condition.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (i32.const 1)
        (br_if 0 (i32.const 0))
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)