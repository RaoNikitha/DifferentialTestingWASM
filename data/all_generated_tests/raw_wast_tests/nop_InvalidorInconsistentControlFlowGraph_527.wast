;; 8. **Test `nop` in Immediate Loop Iterations**:    Place a `nop` at the start and end of loop iterations to see if loop iteration counts or behaviors change unexpectedly.

(assert_invalid
  (module
    (func (loop (nop) (br 0) (nop)))
  )
  "type mismatch"
)