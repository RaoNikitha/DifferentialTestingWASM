;; Test 4: Position a `nop` just before an end boundary of a `loop`, then use a `br` to that loop. Ensure that the loop restarts correctly and the control flow behaves as expected.

(assert_invalid
  (module
    (func $loop-with-br
      (loop $myLoop
        nop
        (br $myLoop)
      )
    )
  )
  "undefined label"
)