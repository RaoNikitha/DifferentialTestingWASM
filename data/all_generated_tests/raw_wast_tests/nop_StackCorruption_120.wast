;; 1. Insert a `nop` instruction between a sequence of valid stack operations in a loop. This ensures the loop’s stack state remains intact across multiple iterations.

(assert_invalid
  (module
    (func (loop (nop) (i32.const 1) (drop) (br 0))))
  "invalid block type"
)