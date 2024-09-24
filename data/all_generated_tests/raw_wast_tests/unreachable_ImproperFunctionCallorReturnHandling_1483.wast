;; 4. Create a function that performs a `loop` containing a call to another function that has an `unreachable` instruction. Test if the trap occurs consistently inside the loop.

(assert_invalid
  (module
    (func $callee (unreachable))
    (func (loop (call $callee)))
  )
 "unconditional trap"
)