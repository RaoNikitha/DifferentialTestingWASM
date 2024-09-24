;; 8. **Test with `nop` in a loop that modifies global state and uses `br` for termination**:    - **Constraint**: Ensures `nop` doesn't interfere with global state checks crucial for loop termination.    - **Relation to Infinite Loops**: If `nop` improperly alters state, the `br` may fail to execute correctly, causing infinite iteration.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $test-nop-in-loop
      (loop $continue
        (nop)
        (global.set $g (i32.add (global.get $g) (i32.const 1)))
        (br_if $continue (i32.lt_u (global.get $g) (i32.const 10)))
      )
    )
  )
  "type mismatch"
)