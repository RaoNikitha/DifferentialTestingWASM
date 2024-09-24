;; Test 4: Design a function call nested within multiple conditional branches (`br_if`) with varying conditions. Check if incorrect condition evaluations lead to different call paths and outputs in the two implementations.

(assert_invalid
  (module
    (func $nested_conditional_call
      (i32.const 1)
      (br_if 0 (i32.const 0))
      (br_if 1 (i32.const 1))
      (call 0)
    )
    (func (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
  )
  "function index out of bounds"
)