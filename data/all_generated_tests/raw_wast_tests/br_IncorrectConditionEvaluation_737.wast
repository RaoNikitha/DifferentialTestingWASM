;; 8. **Test Description:**    - Test an early exit with `br_if` where the condition evaluates an external function’s side effect (e.g., function that alternates return values). Ensure branching only occurs in expected cycles.    - **Constraint Checked:** Proper handling of side-effect conditions in branching.    - **Test Relation:** Ensures that condition evaluation respects external function side effects and branching accurately.

(assert_invalid
 (module (func $side_effect_br_if (block $label
   (block
     (br_if 0 (call $external_conditional))
     (i32.const 0)
   )
   (i32.const 1)
 ))
 (func $external_conditional (result i32)
   (local $toggle i32)
   (local.set $toggle
     (i32.xor
       (local.get $toggle)
       (i32.const 1)
     )
   )
   (local.get $toggle)
 ))
 "type mismatch"
)