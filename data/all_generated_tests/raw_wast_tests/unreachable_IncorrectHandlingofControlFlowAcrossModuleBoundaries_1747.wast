;; 8. **Unreachable in Function Exported and Imported Across Multiple Modules:**    - Design a function with an `unreachable` in the first module, export it, have it imported and called by a second module, which itself is exported and called by a third module. Validate correct trapping.    - **Constraint:** Test complex chains of imports and exports across multiple modules, ensuring the `unreachable` correctly leads to a trap throughout the entire chain.

 ;; (module
  (func $mod1_func (export "unreachable_func") (unreachable))
)

(module
  (import "module1" "unreachable_func" (func $imported_unreachable_func))
  (func $mod2_func (export "wrapper_unreachable_func")
    (call $imported_unreachable_func)
  )
)

(assert_invalid
  (module
    (import "module2" "wrapper_unreachable_func" (func $imported_wrapper_func))
    (start $imported_wrapper_func)
  )
  "unexpected trap"
)