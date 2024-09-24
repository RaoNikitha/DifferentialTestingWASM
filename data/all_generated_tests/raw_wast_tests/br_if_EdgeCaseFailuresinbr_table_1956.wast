;; Test 7: Place a `br_table` immediately following an `if` statement with multiple operand stack manipulations, using an out-of-range index to test the robustness of label reference within the control flow.

(assert_invalid
  (module
    (func (block
      (if (i32.const 1)
        (then
          (i32.const 0)
          (br_table 1 2 3 (i32.const 2))
        )
      )
    ))
  )
  "type mismatch"
)