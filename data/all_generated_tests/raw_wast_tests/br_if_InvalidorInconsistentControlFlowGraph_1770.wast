;; 1. **Test Case 1**: Create a nested `br_if` within blocks where the label index refers to a deeper nesting level than possible. This should result in an invalid instruction due to label reference out-of-bounds.    - **Constraint Checked**: Ensuring label indices refer to valid structured control instructions in the context.    - **CFG Relation**: Incorrect CFG if label references are not validated correctly, causing potential control transfer to nonexistent blocks.

(assert_invalid
  (module (func (block (block (br_if 2 (i32.const 1))))))
  "unknown label"
)