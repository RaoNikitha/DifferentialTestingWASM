;; 10. **Test Description:**     - Design a control structure including an `if` statement followed by a `block` and a `br` instruction targeting the outermost `if`.     - **Constraint:** Check that the branch correctly moves execution to resume after the outer `if`’s `end`.     - **CFG Check:** Ensures well-nested control flow and proper handling of branches targeting `if` statements, verifying correct CFG management for nested conditional constructs.

(assert_invalid
 (module
  (func (if (i32.const 1)
    (block (br 1))
   )
  )
 )
 "unknown label"
)