;; 7. Design an `if` instruction that misaligns the expected block type's input and output, forcing explicit operand stack handling within the block. Verify if such misalignments cause divergence in how stacks are managed between implementations.

(assert_invalid
  (module (func $misaligned-stack-handling
    (if (result i32)
      (i32.const 1)
      (then (i32.const 2) (i32.add) (f32.const 1.0))
      (else (i32.const 3))
      (drop)
    )
  ))
  "type mismatch"
)