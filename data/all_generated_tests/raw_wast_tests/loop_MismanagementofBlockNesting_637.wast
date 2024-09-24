;; 8. **Loop Inside Conditional Block**:    Include a `loop` inside an `if` block that's conditional on dynamic runtime values, with branches targeting both the loop and the conditional block. This scenario ensures correct handling of loops nested within conditional blocks, testing the ability to correctly maintain and resolve nested label contexts.

(assert_invalid
  (module
    (func $loop-inside-conditional
      (param i32) (param i32) (result i32)
      (local i32)
      (local.set 2 (i32.const 0))
      (block (result i32)
        (if (result i32)
          (i32.eq (local.get 0) (local.get 1))
          (loop (result i32)
            (br_if 0 (i32.eq (local.get 2) (i32.const 10)))
            (local.set 2 (i32.add (local.get 2) (i32.const 1)))
            (br 0)
          )
          (i32.const -1)
        )
      )
    )
  )
  "type mismatch"
)