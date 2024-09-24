;; 4.  *Test Description*: Test a scenario where a branch is taken within a loop in an imported function, and subsequent branches refer to labels in the calling module.     *Constraint Being Checked*: Ensures that the label indexing and resolution are correctly handled when context switches occur between calling and called modules.

(assert_invalid
  (module
    (func $imported-func (import "env" "importedFunc"))
    (func
      (block
        (loop
          (call $imported-func) 
          (br 2)
        )
      )
    )
  )
  "unknown label"
)