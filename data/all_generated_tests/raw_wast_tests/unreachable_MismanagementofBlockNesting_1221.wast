;; 2. **Loop Containing Unreachable and Block:**    - Define a loop containing a block, and place the `unreachable` instruction within the block. This test checks if the loop correctly traps and terminates without executing further instructions when `unreachable` is hit inside the block.

(assert_invalid
  (module (func $loop-containing-unreachable-block
    (loop (block (unreachable))) 
  ))
  "type mismatch"
)