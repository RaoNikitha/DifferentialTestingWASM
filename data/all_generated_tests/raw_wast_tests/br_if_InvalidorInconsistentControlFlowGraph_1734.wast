;; 5. **Test 5**:    - **Description**: A mixed structure containing interleaved `block` and `loop` instructions, with `br_if` targeting different control flows based on varying conditions.    - **Constraint**: Testing operand stack handling in mixed control flows.    - **CFG Relation**: Verifies CFG paths are generated correctly for mixed nested structures.

(assert_invalid
  (module
    (func $label-mixed-block-loop
      (block $outer
        (loop $inner
          (br_if 0 (i32.const 1)) ;; targets loop (backward jump)
          (block $middle
            (br_if 2 (i32.const 0)) ;; targets outer block (forward jump)
            (br_if 1 (i32.const 1)) ;; targets the middle block (forward jump)
          )
        )
      )
    )
  )
  "type mismatch or invalid label index in a mixed structure"
)