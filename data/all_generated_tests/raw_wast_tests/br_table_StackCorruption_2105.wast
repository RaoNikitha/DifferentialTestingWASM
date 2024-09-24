;; 5. **BrTable with Type Mismatch in Branch Targets:**    - Implement a `br_table` instruction where the branch targets have operand types incompatible with the default target, testing for stack corruption when the out-of-bounds default label is chosen.

(assert_invalid
  (module
    (func $type-mismatch-branch-targets
      (block $default (result i32)
        (block $target (result f64)
          (i32.const 0)
          (br_table $target $default)
        )
      )
    )
  )
  "type mismatch"
)