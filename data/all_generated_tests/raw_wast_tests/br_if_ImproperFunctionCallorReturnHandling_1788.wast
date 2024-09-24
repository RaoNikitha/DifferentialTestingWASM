;; 9. **Test 9: Mixed Block Types and Function Calls**: Create scenarios combining `block`, `loop`, and `if` within function calls with `br_if` instruction to see if label targeting differences manifest due to the mixed control flow types and improper depth handling.

(assert_invalid
  (module
    (func $mixed-block-types
      (block (result i32)
        (i32.const 42)
        (loop (block (result i32)
          (if (i32.eqz (i32.const 1))
            (then (br_if 1 (i32.const 1)))
            (else (br_if 2 (i32.const 1)))
          )
        ))
      )
    )
  )
  "unknown label"
)