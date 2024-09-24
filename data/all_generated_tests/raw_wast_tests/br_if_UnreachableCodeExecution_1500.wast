;; - **Test 1**: Construct a nested `block` where a `br_if` instruction with an always false condition (e.g., conditioned on a `0` value) is used. Immediately following the `br_if`, place an `unreachable` instruction. The test checks if failure in conditionally breaking out of the block leads to execution of the `unreachable` instruction.

(assert_invalid
  (module
    (func $nested-block-br_if
      (block
        (i32.const 0)
        (br_if 0 (i32.const 0))
        (unreachable)
      )
    )
  )
  "unreachable executed"
)