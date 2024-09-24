;; 9. **Backward Reference Error**: Test blocks where branches erroneously reference labels that resemble backward reference (negative indices). Ensures `wizard_engine` does not incorrectly resolve or crash on backward-like references.

(assert_invalid
  (module (func $backward-reference-error
    (block (result i32)
      (br -1 (i32.const 42))
    )
  ))
  "unknown label"
)