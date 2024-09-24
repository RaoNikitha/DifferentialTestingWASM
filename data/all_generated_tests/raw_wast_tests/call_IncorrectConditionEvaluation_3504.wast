;; - Define a function that performs conditional branching (`br_if`), depending on whether a parameter is zero. Call this function with zero and a non-zero integer to confirm if condition evaluation affects the branching as intended in both engines.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $conditional-branch (param i32)
      (block
        (br_if 0 (local.get 0))
      )
    )
    (table funcref (elem $conditional-branch))
    (func $test-call
      (call_indirect (type 0) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)