;; 8. **Test Branching in Loop Initialization**: A `loop` with `br_if` affecting its initialization values, directly leading to `unreachable`. This ensures that loops correctly reinitialize their state when the condition is true.

(assert_invalid
  (module
    (func $branch-in-loop-init
      (loop (result i32)
        (i32.const 0) (i32.const 1)
        (br_if 0 (i32.const 1))
        (unreachable)
      )
    )
  )
  "type mismatch"
)