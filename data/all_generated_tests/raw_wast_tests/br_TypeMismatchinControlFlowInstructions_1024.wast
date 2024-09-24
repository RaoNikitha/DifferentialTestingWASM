;; 5. **Test Description:**    - Create a module where `br` instructions jump between `block` structures with differing expected result types, like `i32` in one and `f64` in another, ensuring each `br` provides the correct type.    - **Constraint Check:** Verifies that forward branches respect the operand stack type requirements for result types of the targeted blocks.    - **Differential Behavior:** Wizard Engine's detailed label lookup might miss operand type mismatches, whereas WebAssembly should enforce type constraints, ensuring no type errors occur.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (br 0 (f64.const 0.0))
      )
    )
  )
  "type mismatch"
)