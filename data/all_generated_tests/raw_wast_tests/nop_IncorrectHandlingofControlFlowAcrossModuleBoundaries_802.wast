;; 3. **Test Nested Calls Across Modules with Interleaved `nop`**:    - **Constraint Checked**: Validates that `nop` does not disrupt nested module calls.    - **Description**: Import a function from another module and have nested calls within the functions of the main module, with `nop` instructions interleaved between these calls. Check for differences in stack state or control flow between implementations.

(assert_invalid
  (module
    (import "mod" "f" (func $imported (result i32)))
    (func $main (result i32)
      (nop)
      (call $imported)
      (nop)
      (call $imported)
      (return)
    )
  )
  "type mismatch"
)