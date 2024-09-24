;; Create a structure with nested `block` and `if` instructions. Use a `br` instruction targeting a nonexistent label index, which should lead to the `unreachable` instruction if the branch isn't correctly resolved.

(assert_invalid
  (module (func $invalid-nonexistent-label-target
    (block (block (if (i32.const 1) (br 2))))
  ))
  "label index out of bounds"
)