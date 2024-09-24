;; 4. **Test 4**:    - **Description**: Sequential `block` structures where one contains a `br_if` that conditionally targets the previous block, depending on stack conditions.    - **Constraint**: Confirming operand stack consistency across nested block exits.    - **CFG Relation**: Tests sequential block CFG modeling with inter-block conditional exits.

(assert_invalid
  (module
    (func $sequential-blocks
      (block
        (block
          (block
            (br_if 3 (i32.const 0))
          )
        )
      )
    )
  )
  "unknown label"
)