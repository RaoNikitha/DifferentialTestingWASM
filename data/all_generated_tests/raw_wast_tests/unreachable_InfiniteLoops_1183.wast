;; 4. Introduce a loop with an `unreachable` instruction placed immediately after failing a `br_if` condition meant to control loop continuation, confirming both implementations correctly trap and avoid an infinite loop.

(assert_invalid
  (module
    (func $loop_unreachable
      (loop $my_loop
        (br_if $my_loop (i32.const 0))
        (unreachable)
      )
    )
  )
  "unknown function"
)