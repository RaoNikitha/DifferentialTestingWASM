;; 4. **Test Description 4:** Create a `block` that begins with an `i32.const`, followed by an `if` with `unreachable` in the then branch, without an else branch producing a value. This tests both the block and if structures' type enforcement regarding unreachable instructions inside them.

(assert_invalid
  (module (func $block-unreachable-if
    (block
      (i32.const 1)
      (if (i32.const 1)
        (then (unreachable))
      )
      (i32.const 2)
    )
  ))
  "type mismatch"
)