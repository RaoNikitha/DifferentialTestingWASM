;; 2. **Loop with Multiple Nops and Branch**: Create a loop where multiple `nops` are placed before a `br` and `br_if` instruction targeting the loop. This checks if the branch correctly jumps back to the start of the loop or a specific label within it, ensuring the `nop` doesn't cause incorrect target resolution.

(assert_invalid
  (module
    (func $loop-with-nops (loop $loop_label (nop) (nop) (nop) (br $loop_label)))
  )
  "branch to label"
)