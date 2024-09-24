;; 4. **Test `nop` Within Loop Containing Imported Function Call**:     - **Constraint Checked**: Ensures loop control with `nop` does not disrupt calls to imported functions.    - **Description**: Create an infinite loop in an exported function, calling an imported function with `nop` instructions interspersed inside the loop. Verify the correct execution flow is maintained across boundary transitions.

(assert_malformed
  (module
    (import "env" "externalFunc" (func $imported))
    (func (export "test")
      (loop
        (nop)
        (call $imported)
        (br 0)
      )
      (nop)
    )
  )
  "invalid syntax"
)