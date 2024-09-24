;; 6. **Branch with Operand Mismatch Test**: Design a test with a `br` instruction targeting a block or loop label where the operand stack height on branch execution does not match the expected operand height. Ensure that the operand unwinding and stack height are correctly managed.

(assert_invalid
  (module (func $br-operand-mismatch
    (block (result i32) (i32.const 1) (block (br 1 (i32.const 2))))
  ))
  "type mismatch"
)