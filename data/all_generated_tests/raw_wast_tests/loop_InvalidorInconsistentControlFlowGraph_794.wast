;; 5. **Indirect Branch into Incorrect Context**:     - **Description**: Implement a `br_table` inside a loop that indirectly branches to a context outside the loop, expecting proper context management and validation in indirect branches.     - **Constraint**: Indirect branch validation extending across various contexts.     - **CFG Impact**: Incorrect handling of indirect branches results in misinterpreted loop structures in CFG.

(assert_invalid
  (module
    (func (loop $loop1 (block (br_table $loop1 0))))
  )
  "type mismatch"
)