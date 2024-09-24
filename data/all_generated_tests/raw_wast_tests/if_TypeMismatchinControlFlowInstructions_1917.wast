;; Test an `if` block expecting an input stack with `[f32, i32]`, but within the `then` clause the instructions expect and produce `[i32, i32]`. This tests the implementations' validation of type constraints at the entry and exit of the control flow.

(assert_invalid
  (module
    (func $mismatched-stack
      (local f32 i32)
      (local.get 1)
      (if (result i32)
        (then 
          (local.get 0)   ;; f32
          (local.get 0)   ;; f32
        )
      )
    )
  )
  "type mismatch"
)