;; 4. Create a loop with a `br_table` where some target labels point to forward branches within the loop and others to external blocks outside the loop. Manipulate operand stacks to mismatch expected types when certain branches are incorrectly taken, testing the CFG consistency under mixed control flow rules.

(assert_invalid
  (module
    (func $loop_with_mixed_br_table
      (loop $loop
        (block $exit
          (i32.const 5) ;; Constant operand for the br_table
          (block $internal (br_table 1 0 $exit $internal (i32.const 0)))
          (i32.const 0) (i32.eqz) (br_if $loop)
        )
        (i32.const 0) (drop)
      )
    )
  )
  "type mismatch"
)