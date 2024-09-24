;; 1. **Test for Unreferenced Label:**    - **Description**: A `br` instruction targeting a label that is not defined within the structured control hierarchy.    - **Constraint Checked**: Ensures the label `C.labels[l]` is defined in the context.    - **Relation to CFG**: Verifies that the implementation correctly handles an illegal branch to an undefined label, maintaining CFG integrity.

(assert_invalid
  (module (func (block (result i32) (br 1 (i32.const 0)))))
  "unknown label"
)