;; 6. Establish a block that decorates a nested block containing `br_if` influenced by a condition to a mis-targeted block that leads outside the parent, reaching an `unreachable` instruction. Validate branch instruction's handling conforms to constraint rules without executing unreachable code.

(assert_invalid
  (module (func $type-block-br_if-incorrect
    (block
      (block (br_if 1 (i32.const 1)) (unreachable))
      (unreachable)
    )
  ))
  "type mismatch"
)