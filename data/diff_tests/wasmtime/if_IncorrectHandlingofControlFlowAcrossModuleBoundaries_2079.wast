;; 10. **Test for Nested Module Calls**:    - Ensure control flows correctly through nested `if` blocks when the innermost block involves calling a function from a different module, testing if multiple layers of cross-boundary calls are handled without flow corruption.    - **Constraint Focus**: Validates nested control flow correctness involving multiple module calls.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func $nested-if-with-call (param i32) (result i32)
      (if (result i32) (local.get 0)
        (then
          (if (result i32) (i32.const 1)
            (then (call $external_func (i32.const 10)))
            (else (call $external_func (i32.const 20)))
          )
        )
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)