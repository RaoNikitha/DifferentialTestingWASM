;; 5. **Stack Height Mismatch during Branching**:    - Construct an `if` block where a `br` instruction is used, and the stack height at the branch point doesn't align with the expected block type. Test for differential resolution based on the stack's state during branching.    - **Constraint**: Maintain operand stack management consistency while correctly resolving branches according to block types.

(assert_invalid
  (module
    (func $stack-height-mismatch-br
      (block (result i32 i32) ;; Expected block type result
        (if (result i32 i32) ;; If block with the same result type
          (i32.const 1) (then
            (i32.const 1) ;; Producing 1 i32 value
            (br 0) ;; Branching to the block while stack expects 2 values
          ) (else
            (i32.const 2) (i32.const 3) ;; Correctly producing 2 i32 values
          )
        )
      )
    )
  )
  "type mismatch"
)