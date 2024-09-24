;; 10. **Test: Conditional Execution of Imported Function with `br_if` and Stack Polymorphism**    - **Constraint Checked:** Confirm that `br_if` in an imported function handles polymorphic stack states without error.    - **Description:** Import a function using `br_if` in a context that expects a polymorphic stack. Call from a module with varying stack conditions, ensuring the function adapts correctly and handles stack polymorphism as required.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func
      (block (result i32)
        (br_if 0 (call $external_func))
      )
      (i32.const 0)
    )
  )
  "polymorphic stack handling"
)