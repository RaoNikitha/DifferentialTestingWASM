;; 4. **Test 4: Branch Through Table with Mismatched Indices**    - Description: Create a `br_table` instruction inside a loop that includes a table targeting multiple labels, some of which are intentionally misaligned with nested block structures. Verify that branches resolve correctly.    - Constraint: Ensures proper handling of indirect branches through tables with indices, ensuring no incorrect jumps occur.

(assert_invalid
  (module
    (func $br_table_mismatch (result i32)
      (block $lbl1
        (loop $lbl0 (result i32)
          (i32.const 0)
          (br_table $lbl0 $lbl1 1)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)