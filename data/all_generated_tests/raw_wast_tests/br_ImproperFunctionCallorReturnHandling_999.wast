;; 10. **Test Description:** Function A with an if-else block where inner-block of `if` calls Function B containing a `br` to target the outer `else` block of Function A.    **Constraint Checked:** Cross-scope label resolution in branching within if-else with nested function calls.    **Relation to Function Call/Return Handling:** Ensures proper execution flow in conditional blocks, confirming correct label targeting and returns across function boundary.

(assert_invalid
  (module
    (func $func_b
      (br 1)
    )
    (func $func_a
      (if (result i32)
        (then
          (call $func_b)
        )
        (else
          (i32.const 1)
        )
      )
    )
  )
  "unknown label"
)