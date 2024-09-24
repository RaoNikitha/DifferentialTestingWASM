;; 5. **Test 5: Br Table with `nop` Instructions**:    - **Description**: Use `br_table` with `nop` instructions interleaved within the block containing the table. Check that the branch table correctly resolves the target label index with `nop` present.    - **Constraint**: Ensure that the index calculation for `br_table` is unaffectd by surrounding `nop` instructions.    - **Relation to Incorrect Branch Target Resolution**: Ensures that the complex branching logic of `br_table` is not corrupted by the presence of `nop`.

(assert_invalid
  (module
    (func (block $label_0
      (nop)
      (br_table $label_0 (i32.const 0)))) )
  "unexpected end of section or function")