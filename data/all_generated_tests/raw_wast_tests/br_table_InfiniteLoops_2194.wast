;; 4. **Test 4: Mismatched Operand Types in `br_table`**    - Description: Introduce a `br_table` within a block that expects mismatched operand types, ensuring the stack configuration is checked properly.    - Specific Constraint: Validates type matching mechanisms to avoid incorrect operand handling.    - Infinite Loop Relation: Type mismatches might lead to improper branching or stack unwinding, potentially leading back to the beginning of a loop.

(assert_invalid
  (module (func $mismatched-operand-types
    (block (result i32)
      (block $target (result i64)
        (i64.const 42)
        (br_table $target (i32.const 0))
      )
      (i64.eqz) (drop)
    )
  ))
  "type mismatch"
)