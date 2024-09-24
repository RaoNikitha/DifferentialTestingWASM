;; 4. **Test Invalid Label Indexing**:    - Implement a `loop` and include a branch instruction (`br`) with an invalid label index that surpasses the nested loop depth.    - **Constraint**: Correct labelling and index handling.    - **CFG Impact**: Incorrect labels can result in branches pointing to non-existent CFG nodes.

(assert_invalid
  (module
    (func $invalid-label-index
      (loop (result i32)
        (block
          (br 2)
        )
        (i32.const 1)
      )
      (drop)
    )
  )
  "unknown label"
)