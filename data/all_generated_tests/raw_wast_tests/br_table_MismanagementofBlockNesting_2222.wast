;; 2. Test a `br_table` instruction at a specific nesting depth where the operand is out of bounds and should resolve to the default label. This tests if the implementation correctly handles the default label in a nested context.

(assert_invalid
  (module (func $nested-default
    (block (block (block (br_table 0 0 2 (i32.const 3)))))
  ))
  "unknown label"
)