;; 5. Define a function that begins with `unreachable` and follow it with a `block` containing a `return` instruction. Check if the `unreachable` prevents the block from executing or if the block’s return is improperly reached.

(assert_invalid
  (module (func (result i32)
    unreachable
    (block (result i32) (return (i32.const 42)))
  ))
  "type mismatch"
)