;; 1. Create a test case with a `br_table` instruction that has an intentionally out-of-bounds operand, ensuring the default label points to a block containing the `unreachable` instruction. Check if the control flow correctly jumps to the default label or if it mishandles the operand, leading to `unreachable` being executed unexpectedly.

(assert_invalid
  (module
    (func $out_of_bounds_br_table
      (block $default (unreachable))
      (block (block (br_table 1 0 (i32.const 2))))
    )
  )
  "unknown label"
)