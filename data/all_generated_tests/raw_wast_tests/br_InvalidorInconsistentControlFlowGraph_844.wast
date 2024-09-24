;; 5. **Unwinding Operand Stack beyond Valid Height:**    - **Test Description:** Test a `br` instruction that attempts to unwind more operands than were initially pushed in the enclosing block, ensuring that stack height constraints are respected.    - **Constraint Tested:** Operand stack unwinding within valid height limits.    - **CFG Relevance:** Unwinding beyond valid stack heights can disrupt the CFG by creating branches that do not align with stack usage rules.

(assert_invalid
  (module (func $unwind-beyond-height
    (block (i32.const 0) (br 0)) 
  ))
  "stack height mismatch"
)