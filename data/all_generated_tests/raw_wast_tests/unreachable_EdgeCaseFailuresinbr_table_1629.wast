;; 10. Implement a `br_table` with mixed valid targets and one `unreachable`, focusing on the transition between valid branches and an unconditional trap. This checks if the unexpected transition to `unreachable` from a valid sequence is correctly handled across implementations.

(assert_invalid
  (module (func $br_table_unreachable
    (block $exit
      (br_table 0 $exit (i32.const 0) (unreachable))
      (i32.const 1)
    )
  ))
  "expected loop, continue, or exit label"
)