;; 1. **Nested Block with Nop Preceding a Branch**: A sequence where a `nop` is placed immediately before a `br` instruction targeting a nested block. Check if the `br` correctly jumps to the block or if it skips due to misinterpretation of `nop`. This verifies if the control flow jumps to the right target even when a `nop` is encountered in the nested structure.

(assert_invalid
  (module
    (func (block $outer (loop $inner (nop) (br $outer)))))
  "type mismatch"
)