;; 1. Test a sequence where a `nop` is followed immediately by an `unreachable` instruction to see if the program correctly traps when it reaches the `unreachable`.

(assert_invalid
  (module (func $unreachable-after-nop (block (nop) (unreachable))))
  "unexpected end of block"
)