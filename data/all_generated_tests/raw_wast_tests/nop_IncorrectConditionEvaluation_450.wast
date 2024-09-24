;; 1. Place a `nop` instruction directly before a `br_if` instruction and set the conditional to false. Verify that in WebAssembly it correctly bypasses the branch, whereas in wizard_engine it may incorrectly trace and affect flow due to debug printing.

(assert_invalid
  (module 
    (func (block (nop) (br_if 0 (i32.const 0))))
  )
  "invalid jump target"
)