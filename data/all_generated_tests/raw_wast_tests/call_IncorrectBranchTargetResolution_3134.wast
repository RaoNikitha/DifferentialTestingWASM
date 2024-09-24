;; 3. **Test Description**:    - Develop a function `F1` that contains blocks with nested conditional branches.    - Within these branches, conditionally invoke another function `F2` with varying parameters based on conditions.    - Insert additional branches within these conditionals to stress-test the correct target resolutions.    - **Constraint Checked**: Consistency of branching logic and function type checking within conditionals.    - **Incorrect Branch Target Resolution**: Branches may incorrectly target inside/outside of conditionals affecting `call` execution paths.

(assert_invalid
  (module
    (func $F2 (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func $F1 (result i32)
      (block
        (i32.const 0)
        (br_if 0 (i32.const 1))
        (block
          (call $F2 (i32.const 1))
          (br_if 1 (i32.const 0))
          (call $F2 (i32.const 2))
        )
        (call $F2 (i32.const 3))
      )
    )
  )
  "type mismatch"
)