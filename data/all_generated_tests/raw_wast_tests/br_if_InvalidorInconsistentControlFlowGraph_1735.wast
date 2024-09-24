;; 6. **Test 6**:    - **Description**: Complex, nested `if-else` structures with `br_if` branching to both inner and outer blocks based on different stack operands and conditions.    - **Constraint**: Ensuring type and stack transformations are handled correctly in conditional branches.    - **CFG Relation**: Confirms CFG accurately represents complex `if-else` branching.

(assert_invalid
  (module
    (func $nested-if-else-br_if
      (block $outer (result i32)
        (i32.const 1)
        (if (result i32)
          (then
            (block $inner (result i32)
              (i32.const 2)
              (br_if 0 (i32.const 1)) 
            )
          )
          (else
            (block $inner_else (result i32)
              (i32.const 3)
              (br_if 1 (i32.const 1))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)