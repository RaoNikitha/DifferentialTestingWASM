;; 9. **Test Description:**    - Create a module exporting a variadic function. Import and invoke this function indirectly using `call_indirect` in another module, ensuring stack and memory management handle variable arguments correctly.    - **Constraint:** Validate variadic function support and stack operations across module boundaries.    - **Context:** Ensures variadic arguments are correctly managed across modules when using `call_indirect`.    -

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (import "env" "variadic_func" (func $variadic_func (type 0)))
    (table 1 funcref)
    (elem (i32.const 0) $variadic_func)
    (func $test
      (call_indirect (type 0) (i32.const 0) (i32.const 42))
    )
  )
  "type mismatch"
)