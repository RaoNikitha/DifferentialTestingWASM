;; 1. **Test Outside Scope Label Reference**:    Define a loop that contains a branch (`br`) instruction referring to a label outside the loop block's scope. This tests if the implementation incorrectly resolves the label to a non-existent or incorrect block.

(assert_invalid
  (module (func $outside_scope_label_ref
    (loop (br 1)) 
  ))
  "unknown label"
)