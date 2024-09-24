;; Test a `br_table` instruction with an index value that is exactly one more than the number of available targets. This checks if the `Wizard Engine`'s `setUnreachable` properly handles out-of-bounds indices, whereas WebAssembly implementation should validate context and operand stack match correctly.

(assert_invalid
  (module
    (func $out_of_bounds_br_table
      (block
        (br_table 1 0 (i32.const 2))
      )
    )
  )
  "index out of range"
)