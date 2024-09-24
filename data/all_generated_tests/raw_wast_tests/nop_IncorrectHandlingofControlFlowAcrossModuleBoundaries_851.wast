;; 2. **Test Description**: Insert `nop` instructions immediately before and after an exported function call within a module to verify it does not change the control flow when the calling module resumes execution.    - **Constraint**: Validate proper control resumption post `nop` execution.    - **Relates to**: Ensures `nop` presence does not alter control flow correctness across module boundaries.

(assert_invalid
  (module
    (func $external (export "external") (nop) (call $internal) (nop))
    (func $internal (nop))
  )
  "type mismatch"
)