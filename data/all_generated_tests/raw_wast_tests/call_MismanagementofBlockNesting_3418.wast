;; 7. **Returns in Deep Nested Structures**:    - **Description**: Nested structures (`block`, `loop`, `if`) containing calls to functions that return multiple values, mismanage or match the expected stack signature.    - **Constraint**: Functions must return the types expected by the nested structures, verifying correct type validation.    - **Relation to Mismanagement of Block Nesting**: Verifies the proper stack handling and type-checking within nested returns and control flow structures.

(assert_invalid
  (module
    (func $f (result i32 f64) (i32.const 1) (f64.const 2.0))
    (type $sig (func (result i32 f64)))
    (table funcref (elem $f))
    (func $nested-returns
      (block (result i32 f64)
        (loop (result i32 f64)
          (call $f)
        )
      )
    )
  )
  "type mismatch"
)