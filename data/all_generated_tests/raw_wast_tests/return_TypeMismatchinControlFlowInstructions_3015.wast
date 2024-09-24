;; Validate a function that includes a `br` (branch) instruction to an outer block with a mismatched type expectation. The `return` should fail due to incorrect type propagation from the branch.

(assert_invalid
  (module
    (func $type-mismatch-branch-in-loop (result i32)
      (i32.const 0)
      (loop
        (br 1))
      (return)
    )
  )
  "type mismatch"
)