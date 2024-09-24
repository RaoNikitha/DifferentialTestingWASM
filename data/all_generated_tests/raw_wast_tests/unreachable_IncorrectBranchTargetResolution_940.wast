;; 1. Construct a module with nested blocks where an `unreachable` instruction is placed before a `br` instruction that targets an outer block. Verify if `unreachable` causes an immediate trap without resolving the branch to the outer block.

(assert_invalid
  (module (func (block (block (unreachable) (br 1)))))
  "type mismatch"
)