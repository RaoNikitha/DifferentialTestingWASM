;; Test 2: Place an `unreachable` instruction inside a `block` and follow it with valid stack operations like `i32.const 1`. This examines if subsequent instructions within the block are executed, which they shouldn't be.

(assert_invalid
  (module (func (block (unreachable) (i32.const 1) (drop))))
  "type mismatch"
)