;; Place an `unreachable` instruction inside a block, followed by a `br` instruction that erroneously targets a non-existent label. Validate if the WebAssembly environment traps immediately as specified or if any label resolution inconsistency occurs in the wizard_engine.

(assert_invalid
  (module (func $test-unreachable-br-invalid-label
    (block $valid
      (unreachable)
      (br $invalid)
    )
  ))
  "unknown label"
)