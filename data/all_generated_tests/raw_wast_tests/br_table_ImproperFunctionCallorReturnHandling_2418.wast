;; 8. **Test of Nested br_table inside Function Calls**:     - Implement nested `br_table` instructions inside different function calls, each with its label targets.    - *Constraint*: Check if function calls preserve the context of nested `br_table` instructions correctly.    - *Relation to Improper Function Call or Return Handling*: Ensures proper nesting and context management of `br_table` within function calls, avoiding call stack corruption.

(assert_invalid
  (module
    (func $nested_br_table_inside_calls
      (block
        (call $inner_func)
        (br 1)
        (unreachable)
      )
    )
    (func $inner_func
      (block
        (block (br_table 0 1 2 (i32.const 1)))
        (unreachable)
      )
    )
  )
  "unknown label"
)