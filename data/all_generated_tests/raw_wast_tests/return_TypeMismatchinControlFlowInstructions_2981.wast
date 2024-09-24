;; 10. **Test 10 - Outermost Block Type Enforcement**:     - Description: Within an outermost block expecting an integer, provide a nested return instruction with a floating-point value before the block ends.     - Constraint: This test validates the correct targeting and type enforcement of outermost blocks by the `return` instruction.

(assert_invalid
  (module
    (func $outermost-block-type-enforcement (result i32)
      (block (result i32)
        (f32.const 0.0)
        (return)
      )
    )
  )
  "type mismatch"
)