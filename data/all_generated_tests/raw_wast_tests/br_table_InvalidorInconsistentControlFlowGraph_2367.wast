;; 7. **Test with Immediate Encoding Errors:**    - **Description:** Implement `br_table` with deliberate encoding errors in the immediate label vector. Ensure CFG detects and reports this invalid vector configuration.    - **Constraint Checked:** CFG handling of immediate parameters and ensuring label vectors and default labels are correctly encoded and interpreted.

(assert_malformed
  (module (func $immediate-encoding-error
    (block (br_table 0 0xG ))) ; deliberately malformed immediate vector encoding
) "unexpected token")