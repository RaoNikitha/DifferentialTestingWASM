;; 4. Implement a `br` (branch) instruction to a label defined within a `block`, followed by an `unreachable` instruction. Ensure subsequent instructions assume the block produces a result type, leading to a type mismatch.

(assert_invalid
  (module (func $block-branch-unreachable-type-mismatch
    (block $label
      (br $label)
    )
    (unreachable)
    (i32.const 0)
  ))
  "type mismatch"
)