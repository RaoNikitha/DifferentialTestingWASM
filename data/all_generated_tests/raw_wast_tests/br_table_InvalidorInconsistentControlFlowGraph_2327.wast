;; 7. **Non-matching Operand Types on Backward Branch:**    Use `br_table` to branch backward in a loop by an index that requires non-matching operand types. This tests whether the CFG identifies incorrect restarting block's operand configuration and avoids execution issues.

(assert_invalid
  (module
    (func (loop $loop (i32.const 0) (br_table 0 $loop))
  ))
  "type mismatch"
)