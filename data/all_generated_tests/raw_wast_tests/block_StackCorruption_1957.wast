;; 8. **Interleaving Pops and Pushes**: Simulate a block that has intermixed pop and push operations; resulting in potentially improper stack height. Validate correct stack height is preserved once the block ends while preventing stack overflow or underflow.

(assert_invalid
  (module (func $interleaving-pops-and-pushes
    (block (result i32)
      (i32.const 1)
      (drop)
      (i32.const 2)
      (block
        (drop)
        (i32.const 3)
      )
    )
  ))
  "type mismatch"
)