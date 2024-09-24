;; 2. **Test Description 2:**    Create a `br_table` instruction with an index slightly above the number of available targets. This should trigger out-of-bounds errors. Check if the error handling is correctly implemented, especially in the verbose bounds checking of the Wizard Engine.

(assert_invalid
  (module (func $out_of_bounds_br_table
    (block (br_table 0 1 2 3 4 (i32.const 6)))
  ))
  "unknown label"
)