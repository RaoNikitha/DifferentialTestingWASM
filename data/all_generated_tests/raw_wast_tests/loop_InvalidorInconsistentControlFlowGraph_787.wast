;; 8. **Incorrect Context Prepending in Loop**:    - Construct a loop where the context `C0` is not correctly prepended with the expected labels vector. Verify if both implementations manage context extension and label handling differently, resulting in an inconsistent CFG.

(assert_invalid
  (module (func $incorrect-context-prepending
    (loop (result i32) (loop (result i32) (br 1)))
  ))
  "type mismatch"
)