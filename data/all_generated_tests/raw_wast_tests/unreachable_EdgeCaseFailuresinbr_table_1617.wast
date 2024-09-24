;; 8. **Test Description:**     A `br_table` instruction used within a switch-like structure with default fall-through paths leading to different levels of nested blocks, and an `unreachable` in the default handling path to enforce a trap.    **Constraint Checked:** Tests how default path handling and unreachable execution cause consistent traps.    **Edge Case Relation:** Evaluates fallback path handling in complex structures with `br_table`.

(assert_invalid
  (module
    (func $br_table_nested_blocks (param i32) (result i32)
      (block $outer (block $inner
        (br_table $outer $inner (get_local 0))
        (unreachable)
        (i32.const 0)
      ))
      (i32.const 1)
    )
  )
  "type mismatch"
)