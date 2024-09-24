;; 6. **Test: Chained Function Calls Between Modules with Intermediate Nops**    - Construct two modules with a call chain between three or more functions interspersed with `nop`. Import the chain in Module B and call the functions sequentially. Ensure function calls maintain correct stack state.    - **Constraint Check**: Ensures multi-function control flow integrity with `nop` instructions amid function calls across modules.    - **Relation to Differential Handling**: Faulty initialization context causing stack issues during chained function calls in wizard_engine.

(assert_invalid
  (module
    (import "ModuleA" "func1" (func $func1 (nop)))
    (func (export "func2") (call $func1) (nop) (call $func1))
  )
  "chained function calls with intermediate nop"
)