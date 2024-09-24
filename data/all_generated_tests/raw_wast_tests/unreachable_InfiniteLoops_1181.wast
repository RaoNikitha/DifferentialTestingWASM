;; 2. Utilize an infinite loop where `unreachable` is placed in the middle of a `loop` block, but the `br` instruction lies beyond unpublished paths. Check that `unreachable` causes an immediate trap regardless of the loop's infinite nature.

(assert_invalid
  (module (func $unreachable-in-loop 
    (loop 
      (unreachable) 
      (br 0)
    )
  ))
  "unreachable executed"
)