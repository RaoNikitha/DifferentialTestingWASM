;; 8. Establish a loop containing multiple conditions evaluated outside the loop and propagated via `local.get` with `br_if` inside. Confirm that branches reflect the updated condition state within each loop iteration.

(assert_invalid
  (module
    (func (result i32)
      (local i32)
      (i32.const 0)
      (local.set 0)
      (loop (result i32)
        (local.get 0)
        (i32.const 1)
        (i32.add)
        (local.set 0)
        (local.get 0)
        (i32.const 10)
        (i32.eq)
        (br_if 0)
        (local.get 0)
      )
    )
  )
  "type mismatch"
)