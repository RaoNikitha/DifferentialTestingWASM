;; 9. **Multiple Independent Loops Interaction**:    - **Description**: Create multiple independent loops within a function, with branches attempting to target other loop instances incorrectly.    - **Constraint Checked**: Ensuring each loop’s label scope is respected and branches do not cross between independent loops.    - **CFG Relevance**: Verifies the CFG distinctly separates and manages independent loop scopes correctly.

(assert_invalid
  (module
    (func $multiple_loops
      (loop (block (br 3))) 
      (loop (block (br 5)))
    )
  )
  "label index out of range"
)