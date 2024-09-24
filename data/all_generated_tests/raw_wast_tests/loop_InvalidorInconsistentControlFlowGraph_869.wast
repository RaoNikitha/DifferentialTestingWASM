;; 10. **Malformed Indirect Jumps Across Loop Boundaries**:     - Design loops with indirect jumps that do not respect loop boundaries and labels, causing jumps to invalid or non-existent instruction addresses. The CFG should flag these as invalid but may fail in different implementations.

(assert_invalid
  (module (func (result i32)
    (block $outer (result i32)
      (loop $inner (result i32)
        (i32.const 0)
        (br_table 1 $inner)
      )
    )
  ))
  "invalid branch target"
)