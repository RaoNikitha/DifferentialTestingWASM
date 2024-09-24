;; 7. **Test for Calling Imported Functions with Wrong Signatures**:    - **Description**: Call an imported function using arguments or expecting return types that do not match its defined signature.    - **Constraint Checked**: Signature matching of imported functions.    - **CFG Relevance**: Ensures CFG can handle signature verification for external calls.

(assert_invalid
  (module
    (import "env" "func" (func $importedFunction (param i32) (result f64)))
    (func (param i32)
      (call $importedFunction (i32.const 1))
    )
  )
  "type mismatch"
)