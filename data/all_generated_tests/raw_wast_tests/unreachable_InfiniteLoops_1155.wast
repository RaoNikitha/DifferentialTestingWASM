;; 6. Create a function that contains an infinite `loop` with a nested `block` where the block itself contains `unreachable`. Ensure the presence of `unreachable` inside the block immediately traps and prevents infinite looping.

(assert_invalid
  (module (func $type-loop-value-nested-block-unreachable
    (loop 
      (block 
        (unreachable)
      )
    )
  ))
  "unreachable executed"
)