;; 10. **Test Nop in Complex Br Table Scenario**: Develop a function with a complex control flow using `br_table` inside nested blocks, interspersed with `nop` instructions. This ensures the `br_table` correctly transitions between blocks while ignoring `nop`.

(assert_invalid
  (module
    (func (block (block (block
      (nop)
      (br_table 0 1 2 (i32.const 0))
      (nop)
      (br_table 0 1 2 (i32.const 1))
      (nop)
      (br_table 0 1 2 (i32.const 2))
      (nop)
    )))))
  "type mismatch"
)