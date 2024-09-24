;; 5. **Test Case 5: `nop` at the beginning of function followed by `unreachable`:**    - **Constraint Checked:** Ensuring initial `nop` does not interfere with function execution context.    - **Expected Behavior:** Function should trap upon executing `unreachable`.    - **Differential Behavior:** Initialization differences in wizard_engine might cause unexpected behaviors.

(assert_invalid
  (module (func $nop-then-unreachable (nop) (unreachable)))
  "unreachable executed"
)