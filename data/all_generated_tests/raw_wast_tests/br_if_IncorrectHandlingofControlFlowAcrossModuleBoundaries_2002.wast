;; 3. **Test Description**:    - **Scenario**: An exported function uses `br_if` inside an `if` block, which conditionally breaks to an outer `block` when the function is invoked from another module.    - **Constraint**: Ensure correct stack unwinding and label resolution when the `br_if` crosses module boundaries.    - **Differential Focus**: Determine if the stack and label management within the `if` block are performed consistently across implementations.

(assert_invalid
  (module
    (func $cross_module_br_if
      (block (result i32)
        (if (result i32)
          (i32.const 1)
          (then
            (br_if 0 (i32.const 1))
          )
        )
      )
      (i32.add)
    )
    (export "cross_module_br_if" (func $cross_module_br_if))
  )
  "type mismatch"
)