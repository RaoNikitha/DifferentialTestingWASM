;; Test 1: Create a function `A` that returns a condition (true if the input is greater than zero, false otherwise). Call another function `B` using `call` with the condition output. Use `br_if` in function `B` to branch only if the condition is true.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $A (param i32) (result i32)
      local.get 0
      i32.const 0
      i32.gt_s
    )
    (func $B (param i32)
      local.get 0
      br_if 0
    )
    (func $main
      i32.const 5
      call $A
      call $B
    )
  )
  "type mismatch"
)