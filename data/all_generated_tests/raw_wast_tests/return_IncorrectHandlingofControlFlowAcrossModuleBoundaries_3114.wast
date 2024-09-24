;; 3. **Nested Function Calls Across Modules**:    - Have a function in one module call another function from a different module, which in turn calls back a function from the first module. Confirm stack integrity and return values are correctly managed throughout this nested call chain.

(assert_invalid
  (module 
    (import "moduleB" "funcB" (func $funcB (result i32)))
    (func $funcA (result i32)
      (call $funcC (call $funcB))
    )
    (func $funcC (param i32) (result i32)
      (return)
    )
  )
  "type mismatch"
)