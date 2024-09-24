;; 9. **Test Case 9:** Insert an `unreachable` instruction in between sequences of valid `br_table` operands, leading to exits to specific labels. Observe whether the function respects immediate traps without considering branching. \    _Constraint Checked: Stack polymorphisms in instruction sequences respecting trap operations._

(assert_invalid
  (module (func $type-br_table-unreachable
    (block
      (loop
        (br_table 0 0 (unreachable))
      )
    )
  ))
  "type mismatch"
)