;; 4. Place `loop` around a simple arithmetic operation and check if `nop` affects the stack type in a subtle way that prevents proper breaking out with a `br` instruction.

(assert_invalid
  (module
    (func (block (loop (nop) (i32.const 0) (i32.const 1) (i32.add) (br 1))))
  )
  "type mismatch"
)