;; 8. **Test 8**:    - **Description**: Inverted control flow where a `block` contains nested `if` structures, each with conditional `br_if` instructions targeting the outer block.    - **Constraint**: Ensuring correct branch handling in deep nested and inverted flows.    - **CFG Relation**: Validates CFG consistency for deeply nested branching structures.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (i32.const 1) (br_if 2)
            (i32.const 0)
            (if (i32.const 1) (then (br_if 1 (i32.const 0)))))))
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)