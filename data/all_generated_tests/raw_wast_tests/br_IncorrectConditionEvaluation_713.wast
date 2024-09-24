;; 4. **Test: Inverting Conditions in `br_if`**    - **Description:** Create a test where the condition logic for `br_if` is intentionally inverted using logical NOT operations. Conditions that should be true are made false and vice versa.    - **Constraint:** Verify that the inversion correctly modifies the control flow, and `br_if` instructions follow the modified logic, ensuring robustness in condition handling.

(assert_invalid
  (module (func $inverted-br-if
    (block (block (br_if 0 (i32.eqz (i32.const 1))))))
  "type mismatch"
)