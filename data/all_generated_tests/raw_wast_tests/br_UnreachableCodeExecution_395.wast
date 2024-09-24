;; 6. A `block` followed by a `loop`, where a `br` inside the loop targets an outer block, with an `unreachable` instruction right after the `br`. This checks correct operand stack management during a forward branch.

(assert_invalid
  (module
    (func $test
      (block $outer
        (loop $inner
          (br $outer)
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)