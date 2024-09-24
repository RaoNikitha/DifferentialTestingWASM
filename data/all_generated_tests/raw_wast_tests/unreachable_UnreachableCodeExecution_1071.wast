;; 2. Place the `unreachable` instruction in the middle of a `block` structure surrounded by type-matching instructions to ensure it leads to an immediate trap upon execution, regardless of being in a block.

(assert_invalid
  (module (func $unreachable-in-block 
    (block (unreachable) (i32.const 1))
  ))
  "type mismatch"
)