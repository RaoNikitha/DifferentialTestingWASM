;; 9. **Test Description**:    Out-of-order label handling where an `if` branch indirectly references preceding loops:    - Tests if improper context propagation in `if` impacts loop terminations and results in infinite loops.

(assert_invalid
  (module
    (func (result i32)
      loop (if (result i32) (i32.const 0) (then)
            (br 1)
            (i32.const 0))
      end)
    )
  )
  "type mismatch"
)