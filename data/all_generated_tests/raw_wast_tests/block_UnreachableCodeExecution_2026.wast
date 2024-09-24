;; 7. **Test Description**:    Establish a scenario where a loop within a block uses `br` to jump back to the start of the loop but places an `unreachable` outside the loop block. Test if incorrect looping takes the execution path to the `unreachable` instruction.

(assert_invalid
  (module (func $block-loop-unreachable
    (block
      (loop $l (br $l))
      (unreachable)
    )
  ))
  "unreachable executed"
)