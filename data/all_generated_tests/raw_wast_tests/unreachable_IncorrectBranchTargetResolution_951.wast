;; 2. **Loop Inside Block Test:**    - Insert an `unreachable` instruction inside a loop that is placed within a block. After the loop, include a `br` instruction targeting the block. Check if execution correctly traps on encountering `unreachable`, preventing the `br` instruction from causing incorrect looping behavior.

(assert_invalid
  (module (func $loop-inside-block
    (block
      (loop
        (unreachable)
      )
      (br 0)
    )
  ))
  "type mismatch"
)