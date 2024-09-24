;; Test 2: Implement a loop that branches to itself (`br 0`), but before the branch, the stack is in an inconsistent state with mixed types. This will check if type constraints are maintained during backward jumps.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (i32.const 1)
        (f32.const 2.0)
        (br 0)
      )
    )
  )
  "type mismatch"
)