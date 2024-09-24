;; 10. **Nested If-Else Structures with Overflow Operand Index:**    - Implement a nested `if-else` structure with `br_table` indexing beyond the valid label list, forcing use of the default target.    - Ensures the implementation correctly resolves to the default label without mismanaging nested `if-else` control flows.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (if (result i32)
        (i32.const 1)
        (br_table 0 1 2 (local.get 0))
        (i32.const 0)
      )
      (i32.add)
    )
  )
  "type mismatch"
)