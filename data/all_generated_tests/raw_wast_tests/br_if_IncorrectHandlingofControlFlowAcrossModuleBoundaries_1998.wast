;; 9. **Test: Chained Method Calls Across Modules with `br_if` Controlled Exits**    - **Constraint Checked:** Ensure that `br_if` maintains execution order and correct stack state when chaining multiple method calls across modules.    - **Description:** A sequence of calls to functions across modules where each function uses `br_if` to possibly exit early. Validate that the overall control and stack state remain consistent.

(assert_invalid
  (module
    (func $moduleA (result i32)
      (block (result i32)
        (call $moduleB)
        (br_if 0 (i32.const 1))
        (i32.const 42)
      )
    )
    (func $moduleB (result i32)
      (block (result i32)
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)