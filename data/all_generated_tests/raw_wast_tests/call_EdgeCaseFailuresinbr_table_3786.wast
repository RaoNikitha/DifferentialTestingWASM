;; 5. Construct a `br_table` with an index that is conditionally modified within a function (using `if` instruction). Verify if both WebAssembly and wizard_engine handle conditional index modifications correctly, especially focusing on wizard_engine’s `checkSignature` method.

(assert_invalid
  (module
    (func $conditional_brtable
      (local i32)
      (i32.store
        (local.set 0 (i32.const 0))
        (i32.load (local.get 0))
      )
      (br_table 0 1 (i32.eqz (local.get 0)))
    )
  )
  "type mismatch"
)