;; Implement a `br_table` with an index calculated dynamically at runtime inside a block. This tests how each implementation deals with non-static indices, checking for robustness in dynamic index evaluation which involves block type checking.

(assert_invalid
  (module (func $br_table-in-block-dynamic-index (result i32)
    (block (result i32)
      (i32.const 1)
      (i32.const 1)
      (i32.add)
      (br_table 0 1)
      (i32.const 0)))
  "type mismatch")
)