;; Use nested `block` and `loop` constructs with conditional breaks (`br_if`) that should not evaluate to true. Place an `unreachable` instruction inside the `block` that should only be executed on reaching the end of the loop, testing if condition evaluation errors cause premature trapping.

(assert_invalid
  (module (func $nested-block-loop-unreachable
    (block
      (loop
        (br_if 1 (i32.const 0))
        (unreachable)
      )
    )
  ))
  "unreachable executed"
)