;; 5. **Test Description**:    - Generate nested `block` and `loop` constructs combined with `nop` instructions and validate if the `end` instructions are correctly processed.    - **Constraint Checked**: Accurate handling of `end` with nested control contexts when `nop` instructions are present.    - **Relation to CFG**: Assures CFG integrity with proper termination of nested control structures.

(assert_invalid
  (module (func (block (loop (nop) (end) (end))))
  "unexpected end"
)