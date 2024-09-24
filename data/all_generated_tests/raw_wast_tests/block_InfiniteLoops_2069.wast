;; 10. **Test Description:** Define a `block` and use deep nesting of blocks with incorrect type annotations, causing stack mismatches.     - **Constraint Checked:** Validates the proper handling of nested block types and operand stack transitions.     - **Infinite Loop Relation:** Mismatched types and incomplete transitions may result in states where loops can be infinitely repeated.

(assert_invalid
  (module (func $deep-nested-blocks (result i32)
    (block (result i32)
      (block (result i64)
        (block (result f32)
          (i32.const 10)
          (br 2 (i64.const 20))
        )
      )
      (i32.const 30)
    )
  ))
  "type mismatch"
)