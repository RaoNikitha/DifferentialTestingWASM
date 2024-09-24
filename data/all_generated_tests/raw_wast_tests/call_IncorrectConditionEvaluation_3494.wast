;; Test 3: Use a `br_if` conditional branch with a valid but edge-case condition (e.g., boundary values like maximum integer values). Call a function based on this condition's evaluation and observe if the branching decisions differ between implementations.

(assert_invalid
  (module
    (func (param i32) (result i32)
      local.get 0
      i32.const 2147483647
      i32.eq
      br_if 0
      call 1
    )
    (func (result i32)
      i32.const 42
    )
  )
  "type mismatch"
)