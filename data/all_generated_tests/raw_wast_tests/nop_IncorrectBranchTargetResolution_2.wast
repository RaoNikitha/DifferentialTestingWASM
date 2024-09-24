;; 3. **Test Description: Loop with `br` and `nop`**    - **Scenario**: Insert `nop` within a loop and apply `br` to target the loop label.    - **Constraint**: Checks if `nop` causes incorrect resolution of the loop label by the `br` instruction.    - **Context**: An incorrectly handled `nop` may cause the loop to exit prematurely or enter an unexpected state.

(assert_malformed
  (module
    (func (loop $L (nop) (br $L)))
  )
  "unexpected token"
)