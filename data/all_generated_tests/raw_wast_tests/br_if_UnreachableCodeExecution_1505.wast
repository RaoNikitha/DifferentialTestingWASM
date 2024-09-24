;; - **Test 6**: Use nested `loop` constructs where an inner loop includes a `br_if` conditioned loop variable. Immediately after the `br_if`, place an `unreachable` instruction. This checks whether the loop variable correctly controls flow and prevents reaching `unreachable`.

(assert_invalid
  (module
    (func $nested-loops-with-br_if
      (loop (i32.const 10)
        (loop (i32.const 1)
          (br_if 1 (i32.const 0))
          (unreachable)
        )
      )
    )
  )
  "jump to outer loop while inner is active"
)