;; 8. **Test: Br_table with Complex Nesting and Unreachable**    - **Description:** Use multiple nested `block` structures with varying depths and table-based branching (`br_table`). Introduce `unreachable` within one of these blocks and test if control exits correctly.    - **Constraint Checked:** Verifies `unreachable` handling within complex nested block structures with table-based branching.    - **Relation to Mismanagement of Block Nesting:** Tests accurate table-based control flow handling in deeply nested contexts with `unreachable`.

(assert_invalid
  (module 
    (func $complex-br_table-unreachable
      (block $outer
        (block $inner
          (br_table 0 0 (i32.const 0))
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)