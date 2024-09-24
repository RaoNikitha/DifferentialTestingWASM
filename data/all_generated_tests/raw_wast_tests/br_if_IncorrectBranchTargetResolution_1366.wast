;; Test 7: - Construct an invalid `br_if` with a label index set to an obviously invalid high number (e.g., `br_if 9999`). Test if WASM correctly throws an out-of-bounds error while wizard_engine shows a different behavior due to how it handles label depth boundaries. - **Constraint Checked**: Bound Checking and Label Management. - **Relation to Incorrect Branch Target Resolution**: Ensures out-of-bounds label references are handled consistently.

(assert_invalid
  (module (func $large-label (br_if 9999 (i32.const 1))))
  "unknown label"
)