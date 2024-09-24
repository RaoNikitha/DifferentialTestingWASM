;; - **Test 5:**    A nested `loop` with an inner `block` where a `br` instruction inside the inner `block` incorrectly targets the nested `loop`, causing infinite iterations since the branch goes back to the loop’s start unconditionally.

(assert_invalid
  (module
    (func $nested-loop-block
      (loop $outer
        (block $inner
          (br 1) ;; This should cause invalid behavior
        )
      )
    )
  )
  "invalid branch target"
)