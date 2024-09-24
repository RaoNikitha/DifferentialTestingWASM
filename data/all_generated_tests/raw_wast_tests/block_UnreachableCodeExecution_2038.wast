;; 9. **Unreachable in Complex Branch Table**:    - Create a complex block with `br_table`, some branches targeting valid instructions, one targeting `unreachable`.    - Verifies `br_table` behavior and its handling of multiple branch targets.    - Mis-implemented index handling causes unintended `unreachable` execution.

(assert_invalid
  (module (func $complex-unreachable-br-table (result i32)
    (block (result i32)
      (i32.const 0)
      (br_table 0 1 2 (unreachable))
      (i32.const 1)
    )
  ))
  "type mismatch"
)