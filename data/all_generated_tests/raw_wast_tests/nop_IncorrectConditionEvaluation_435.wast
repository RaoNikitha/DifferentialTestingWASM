;; Test 6: Place `nop` instructions before a sequence of comparisons leading to a `br_if` condition. Validate if the conditional branch operates correctly based on comparison results.

(assert_invalid
  (module
    (func (param i32) (result i32)
      nop
      nop
      local.get 0
      i32.const 10
      i32.lt_s
      br_if 0
      i32.const 1
    )
  )
  "type mismatch"
)