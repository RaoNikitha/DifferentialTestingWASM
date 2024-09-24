;; - **Test 8**: Design a `block` with a `br_table` targeting index labels mixed between block, loop, and if instructions to test cross-instruction branch handling discrepancies between `wizard_engine` and WebAssembly.

(assert_invalid
  (module (func $br_table-block-loop-if 
    (block (loop (if (i32.const 1) 
      (br_table 0 1 2 (i32.const 0))
      (nop)
    )))))
  "type mismatch"
)