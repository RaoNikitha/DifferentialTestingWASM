;; 2. **`nop` Impact on Loop Condition**:    Place a `nop` inside a loop right before the condition check. Ensure that the loop exits as expected by correctly evaluating the loop condition and not due to an incorrect side effect from `nop`.

(assert_invalid
  (module
    (func $loop_nop
      (loop $continue
        nop
        br_if $continue (i32.const 0)
      )
    )
  )
  "type mismatch"
)