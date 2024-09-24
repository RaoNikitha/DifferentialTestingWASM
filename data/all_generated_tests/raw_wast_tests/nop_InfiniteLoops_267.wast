;; 8. **Test Description: Embed `nop` within a loop where a stack-dependent computation alters the control flow via `br_if`.**    - **Reasoning**: Ensure `nop` does not influence stack operations critical for loop exit.    - **Check**: The loop should exit based on the intended stack-dependent condition.

(assert_invalid
  (module
    (func (loop (nop) (br_if 0 (i32.const 0))))
  )
  "invalid stack operation"
)