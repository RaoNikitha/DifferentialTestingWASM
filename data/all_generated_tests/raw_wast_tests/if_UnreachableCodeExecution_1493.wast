;; 4. **Test Unreachable in `else` After Multiple `if` Blocks**:    - Chain multiple `if-else` blocks where one `else` block has an `unreachable` instruction. Verify whether lack of explicit reset causes unintended flow to this block.

(assert_invalid
  (module 
    (func $test-unreachable-in-else (result i32)
      (if (result i32) (i32.const 1)
        (then (i32.const 0))
        (else (if (i32.const 0)
                 (then (unreachable))
                 (else (i32.const 1))
               )
        )
      )
    )
  )
  "type mismatch"
)