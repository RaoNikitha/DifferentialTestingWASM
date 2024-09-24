;; 2. **Test with `nop` Between Branch Instructions:**    - Insert `nop` instructions between branch instructions to ensure that the control flow graph correctly skips over `nop` without misaligning branches.    - **Constraint Tested:** Verifies that `nop` does not modify the control flow or introduce errors between branches.

(assert_invalid
  (module (func (block (br 0) (nop) (br 0))))
  "invalid break index"
)