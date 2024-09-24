;; 4. **Test 4**: Use a `block` instruction with a `blocktype` indicating an empty input stack but execute it in a context where there are residues on the stack. This checks stack clean-up and correct initial conditions for type constraints.

(assert_invalid
  (module (func (i32.const 0) (block (result i32) (br 0)) end))
  "type mismatch"
)