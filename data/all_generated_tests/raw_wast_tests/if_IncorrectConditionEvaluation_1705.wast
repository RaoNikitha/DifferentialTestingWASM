;; 6. Test where `if` instruction includes `br_if` within the `then` block that relies on stack condition. `WebAssembly Validator` correctly skips `else` block, while `Wizard Engine` misinterprets condition and enters `else`.

(assert_invalid
  (module
    (func $conditional-branch
      (i32.const 0)
      (if (then
        (i32.const 1)
        (br_if 0)
      ) else
        (unreachable)
      )
    )
  )
  "type mismatch"
)