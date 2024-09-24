;; 7. **Test Unreachable Code Following `nop`**:    Use a `nop` instruction followed by `unreachable` to test if the unreachable code detection is consistent across implementations.

(assert_invalid
  (module (func (nop) (unreachable)))
  "unreachable code"
)