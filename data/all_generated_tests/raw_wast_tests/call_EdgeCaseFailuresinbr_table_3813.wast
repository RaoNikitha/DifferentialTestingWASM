;; 2. **Test Description**: Execute a `br_table` instruction where the table is empty but the index is a positive integer. This checks if the implementation correctly identifies that an index cannot be resolved from an empty table and properly traps or defaults.

(assert_invalid
  (module
    (func $f (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func $call-invalid (call $f (i32.const 10) (f64.const 20.0)))
  )
  "type mismatch"
)