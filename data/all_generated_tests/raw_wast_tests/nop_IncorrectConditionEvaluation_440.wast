;; 1. **Test with Immediate `br_if` Following `nop`**: Insert a `nop` instruction followed by a `br_if` where the condition evaluates to zero. The expectation is to not branch. If the `nop` incorrectly affects the condition evaluation, the branch may be taken incorrectly.

(assert_invalid
  (module 
    (func $test (block $exit (nop) (i32.const 0) (br_if $exit (nop))))
  )
  "type mismatch"
)