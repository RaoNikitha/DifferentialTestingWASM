;; 8. **Interrupted Loop with Nested Conditional Branching**:    - Test Description: Generate a WebAssembly module where nested loops are interrupted by conditional branching (`br_if`) targeting different nesting levels.    - Constraint: Confirm that branches to inner or outer levels from a conditional within a loop are managed correctly.    - Relation: This examines conditional evaluations within nested loops for accurate depth resolution and label stack handling.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (loop (result i32)
        (loop (result i32)
          (i32.const 10)
          (i32.eq (local.get 0))
          (br_if 1) 
          (i32.const 20)
          (br 0)
        )
        (i32.const 30)
      )
    )
  )
  "type mismatch"
)