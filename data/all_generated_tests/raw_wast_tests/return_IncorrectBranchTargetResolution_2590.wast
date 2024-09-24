;; 9. **Test across Function Boundaries**    - **Description**: Define multiple functions and use a `return` instruction in such a way that it should only affect the local function boundary.    - **Constraint**: This checks if the `return` respects the current function boundary and does not inadvertently jump across different function contexts.

(assert_invalid
  (module
    (func $func1
      (return)
    )
    (func $func2 (result i32)
      (call $func1)
      (i32.const 1)
    )
  )
  "type mismatch"
)