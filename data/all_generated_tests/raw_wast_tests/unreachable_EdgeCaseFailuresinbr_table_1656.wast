;; 7. **Test 7: Mixed Type Stack with `br_table` Leading to Unreachable**    - A complex stack state followed by a `br_table` which directs to an `unreachable`-filled path leveraging polymorphism.    - **Reasoning:** Verifies stack type handling and consistency leading to an `unreachable` trap.    - **Constraint:** Ensures stack-polymorphic nature of `unreachable` and correct handling in `br_table`.

(assert_invalid
  (module
    (func $mixed-type-stack-br_table (result i32)
      (block (result i32)
        (i64.const 1) (i32.const 0)
        (block
          (unreachable)
          (br_table 0 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)