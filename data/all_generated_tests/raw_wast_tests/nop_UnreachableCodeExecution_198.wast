;; Test 9: Place `nop` inside a function that has multiple nested blocks and conditional branches, with one path inevitably leading to an `unreachable`. Ensure `nop` does not alter the correct path to the `unreachable`.

(assert_invalid
  (module
    (func
      (block
        (block
          (nop)
          (br_if 0 (i32.const 0))
          (unreachable)
        )
        (br_if 1 (i32.const 1))
        (block
          (nop)
          (nop)
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)