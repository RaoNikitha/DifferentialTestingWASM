;; 6. **`nop` Before and After `br_if` with Global State Check**:    Place `nop` before and after a `br_if` instruction that evaluates a global state. Ensure the branch decision depends solely on the global condition and not falsely influenced by the `nop` instruction.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $test
      (nop)
      (br_if 0 (global.get $g))
      (nop)
    )
  )
  "type mismatch"
)