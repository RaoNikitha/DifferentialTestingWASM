;; - **Test 4:**    A `loop` that has a `br_if` instruction within it, where the condition never evaluates to true and the branch always targets the beginning of the loop, causing the loop to execute indefinitely.

(assert_invalid
  (module
    (func $infinite-loop
      (loop $loop_label
        (i32.const 0)
        (br_if $loop_label)
      )
    )
  )
  "unreachable code"
)