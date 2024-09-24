;; 1. **Test Name**: Missing `end` for Nested `if` Blocks    **Description**: Create nested `if` blocks where the inner block is missing an `end` pseudo-instruction. This test checks how each implementation handles the validation of improperly terminated `if` structures.    **Constraints Checked**: Validity of nested blocks and proper termination.    **CFG Issue**: Ensures the control flow graph handles unmatched termination correctly.

(assert_malformed
  (module
    (func 
      (i32.const 1)
      (if (result i32)
        (i32.const 1)
        (then
          (if (result i32)
            (i32.const 1)
            (then
              (i32.const 1)
              ;; Missing `end` here
