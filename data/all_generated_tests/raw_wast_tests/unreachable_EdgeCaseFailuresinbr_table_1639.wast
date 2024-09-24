;; 10. **Test Description:**     - **Edge Case:** Mismatched type expectations within `br_table` branches and `unreachable`.     - **Constraint Checked:** Type polymorphism handling in mismatched branches followed by `unreachable`.     - **Details:** Create a mixed-type scenario within `br_table` branching constructs that eventually hit `unreachable` due to type conflict.

(assert_invalid
  (module
    (func $type-br_table-mismatch-vs-unreachable (result i32)
      (block
        (block
          (br_table 1 0 (i32.const 0) (i64.const 0))
          (unreachable)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)