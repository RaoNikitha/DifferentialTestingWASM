;; 2. **Test for Multiple Nested `if` Blocks with `br` Instructions**:    Design an `if-else` construct with multiple nested `if` blocks, each containing `br` instructions targeting their respective blocks. Validate correct target resolution for branches.    - **Constraint**: Verify each `br` instruction accurately resolves to its enclosing `if` block.    - **Expectation**: Each `br` must jump to its appropriately scoped `if`.

(assert_invalid
  (module (func $nested-if-with-br-target-resolution (result i32)
    (if (result i32) (i32.const 1)
      (then
        (if (result i32) (i32.const 1)
          (then (br 2 (i32.const 1)))
          (else (i32.const 0))
        )
      )
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)