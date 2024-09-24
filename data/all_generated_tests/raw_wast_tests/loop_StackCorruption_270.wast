;; 1. Test a `loop` that takes an initial integer and repeatedly pushes and pops the value from the stack ten times. Confirm that after the loop, the value on top of the stack is the initial value.

(assert_invalid
  (module (func (param i32) (result i32)
    local.get 0
    (loop (param i32) (local.get 0 br_if 1 (loop (param i32)
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      i32.const 10
      i32.gt_s
      br_if 0 
    )))
  ))
  "type mismatch"
)