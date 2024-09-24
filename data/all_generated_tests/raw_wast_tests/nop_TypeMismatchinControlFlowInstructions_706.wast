;; 7. **Test for `nop` inside `if-else` Control Flow**:    - **Description**: Place `nop` inside both `then` and `else` branches of an `if` statement and validate operand stacking behavior.    - **Constraint Checked**: Checks whether `nop` disturbs the type consistency across different control flow paths.    - **Relation**: Ensures that each branch maintains expected stack types independently of `nop` instruction.

(assert_invalid
  (module
    (func $type-if-else-nop (param i32) (result i32)
      (if (i32.eqz (local.get 0))
        (then (nop) (i32.const 1))
        (else (nop) (i32.const 2))
      )
    )
  )
  "type mismatch"
)