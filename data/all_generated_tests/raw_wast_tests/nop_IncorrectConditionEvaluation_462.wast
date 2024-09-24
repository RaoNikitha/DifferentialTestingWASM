;; 3. Develop a nested block structure where the inner block contains a `br_if` immediately after a `nop` instruction, conditioned on a specific stack value. Validate whether the conditional branch skips the inner block differently across implementations.

(assert_invalid
  (module
    (func $test
      i32.const 1
      block
        nop
        i32.const 1
        br_if 0
      end
    )
  )
  "invalid block"
)