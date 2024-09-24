;; 3. **Test Description:**    - Design a nested `if-else` construct within a function, where the `return` instruction is placed inside the `else` branch.    - Ensure the `if-then` branch has a different stack height modification compared to the `else` branch.    - The test checks if the `return` correctly exits from the function and not just from the `if-else` block.    - **Specific Constraint:** Mismanagement of conditional branch depth when using `return`.

(assert_invalid
  (module
    (func $nested-if-else-return (param i32) (result i32)
      (local.get 0)
      (if (result i32)
        (then (i32.add (i32.const 1) (i32.const 1)))
        (else (return))
      )
    )
  )
  "type mismatch"
)