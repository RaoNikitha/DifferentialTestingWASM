;; 10. **Test Improper Loop Stack Unwinding**: Craft a block where a `br_table` references varied label depths, ensuring faulty stack unwinding in one engine leading to a perpetual loop.

(assert_invalid
  (module (func $improper-loop-unwinding
    (block $outer (block $middle (block $inner
      (br_table 2 1 0)
      (i32.const 0)
      (i32.const 1)
      (br $outer)
    )))
  ))
  "type mismatch"
)