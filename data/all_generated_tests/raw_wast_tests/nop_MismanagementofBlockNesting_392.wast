;; 3. **`nop` Between Nested Loops**:    Use nested loops with `nop` instructions placed between them to verify that loops continue to correctly iterate without being prematurely exited or skipped.

(assert_invalid
  (module
    (func (loop (loop (nop) br 1) (nop) br 0))
  )
  "type mismatch"
)