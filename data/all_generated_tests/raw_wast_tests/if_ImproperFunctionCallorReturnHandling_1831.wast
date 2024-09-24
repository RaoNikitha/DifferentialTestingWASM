;; 2. **Indirect Function Call in Else Block With Incorrect Type**:    - Test Description: Have an `if` statement with an `else` block containing a `call_indirect` instruction that does not conform to the blocktype.    - Relevant Constraint: Validates the alignment between the `else` blocktype and the types derived from `call_indirect`.    - Improper Handling Scenario: Detect if `wizard_engine` executes an indirect call to a function of the wrong signature due to inadequate type validation.

(assert_invalid
  (module
    (type $sig_v_i (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (type $sig_v_i) (i32.const 42))
    (func (result i32)
      (if (result i32)
        (i32.const 0)
        (then (i32.const 1))
        (else (call_indirect (type $sig_v_i) (i32.const 0) (i64.const 0)))
      )
    )
  )
  "type mismatch"
)