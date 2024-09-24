;; 4. **Deeply Nested Loops with br_if for Conditional Re-entry**:    - Test Description: Design a WebAssembly module containing several layers of nested loops with conditional branches (`br_if`) testing whether to re-enter outer loops.    - Constraint: The branch condition must properly adjust the label stack and respect the loop type.    - Relation: This test examines conditional branch handling within deeply nested loops, potentially revealing flaws in the label indexing when conditions are evaluated.

(assert_invalid
  (module
    (func $nested-loops-br_if
      (i32.const 0)
      (loop (result i32)
        (loop (result i32)
          (loop (result i32)
            (br_if 1 (i32.const 1))
            (i32.add (local.get 0) (i32.const 1))
            (br_if 2 (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)