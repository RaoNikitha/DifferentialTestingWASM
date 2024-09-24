;; 4. Position multiple `nop` instructions consecutively and ensure there are no changes in control flow or stack behavior.    **Constraint:** Ensure multiple `nop` instructions don't cumulatively influence control flow.

(assert_invalid
 (module (func $multi-nop (result) (nop) (nop) (nop)))
 "type mismatch"
)