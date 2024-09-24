;; 7. **Stack Height Mismatch to Nested Unreachable**:    - Intentionally mismatch stack height requirements leading to an inner `if` block directing to an unreachable code.    - **Constraint**: Tests stack height/type validation and resulting traps from inconsistency.

(assert_invalid
  (module (func $stack-height-mismatch-nested-unreachable
    (if (result i32) (i32.const 1)
      (then
        (block (result i32) (unreachable))
      )
      (else (nop))
    )
  ))
  "type mismatch"
)