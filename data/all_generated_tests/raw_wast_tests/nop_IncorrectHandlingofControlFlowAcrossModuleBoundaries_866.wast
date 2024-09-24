;; 7. **Test: Cross-Module Callbacks with Nop in Callback Function**    - Develop Module A which exports a function containing `nop` in a callback function. Module B calls Module A’s function, invoking the callback. Confirm callback correctness.    - **Constraint Check**: Validates function callback containing `nop` handled correctly across module boundaries.    - **Relation to Differential Handling**: Checks if callback manipulations with `nop` lead to context mishandling in wizard_engine.

(assert_invalid
  (module
    (import "moduleA" "callback" (func (nop)))
    (func (call 0)))
  "type mismatch"
)