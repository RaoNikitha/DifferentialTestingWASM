;; - Test 3: Generate a test where the loop contains a `br_table` handling an operand out of bounds, ensuring `WebAssembly` correctly defaults and exits, whereas `Wizard Engine` reenters the loop endlessly.

(assert_invalid
  (module
    (func $br_table_out_of_bounds
      (loop $loop_label (block $block_label
        (br_table $block_label $loop_label (i32.const 1))
      ))
    )
  )
  "type mismatch"
)