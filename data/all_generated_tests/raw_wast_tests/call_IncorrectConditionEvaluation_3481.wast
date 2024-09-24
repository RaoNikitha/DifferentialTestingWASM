;; Test 10: Implement a function that calls a function which includes a comparison operation resulting in a condition value. Use `br_if` to branch based on whether the comparison result meets specific criteria (e.g., greater than, less than).

(assert_invalid
  (module
    (func $comparison-br-if (call $compare-and-branch (i32.const 5)))
    (func $compare-and-branch (param i32)
      (if (i32.gt_s (local.get 0) (i32.const 3))
        (then (br_if 0 (i32.const 1)))
      )
    )
    (func (param i32) (result i32)
      (local.get 0)
    )
  )
  "type mismatch"
)