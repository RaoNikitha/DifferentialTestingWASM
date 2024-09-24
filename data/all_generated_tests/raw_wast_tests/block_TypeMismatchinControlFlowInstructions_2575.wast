;; 6. **Test Description**:    Implement a `block` instruction with a type mismatch in a `br_table` target, i.e., the block expects an `i32` but receives an `i64` from one of the branch targets. Confirm if both engines detect this mismatch.    **Constraint**: Branch table target types must align with the block type.    **Relation**: Checks if varied branching respects block result types.

(assert_invalid
  (module
    (func $br_table_type_mismatch
      (block (result i32)
        (br_table 0 0 (i64.const 1)) (i32.const 2)
      )
    )
  )
  "type mismatch"
)