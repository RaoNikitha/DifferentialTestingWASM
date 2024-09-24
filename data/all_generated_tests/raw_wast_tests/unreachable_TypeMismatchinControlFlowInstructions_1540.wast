;; 1. Test a block that contains an `unreachable` instruction followed by an `i32.add` instruction. The `unreachable` should prevent the addition, checking if the surrounding block respects the type constraints enforced by an `unreachable` instruction.

(assert_invalid
  (module (func (block (unreachable) (i32.add))))
  "type mismatch"
)