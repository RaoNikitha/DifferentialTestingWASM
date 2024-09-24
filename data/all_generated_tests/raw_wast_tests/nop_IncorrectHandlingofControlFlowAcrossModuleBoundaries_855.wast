;; 6. **Test Description**: Test `nop` within a function that is exported and call it from another module. Verify the caller's stack and control flow are not corrupted.    - **Constraint**: Ensure `nop` does not interfere with the exported function's control flow.    - **Relates to**: Confirms exports handling remains robust with `nop`.

 ;; (module
  (func $exported_func (export "exported_func") (nop))
)
(call $exported_func)