;; 5. **Mixed Instruction Sequence with Interrupting Nops**: Create a sequence of computational instructions interspersed with `nop` preceding a `br_table` instruction. This tests if the correct target is jumped to when the `br_table` is executed, ensuring `nop` interrupts do not misplace the control flow jump locations.

(assert_invalid
  (module
    (func $test (block (br_table 0 1 2) (nop))))
  "type mismatch"
)