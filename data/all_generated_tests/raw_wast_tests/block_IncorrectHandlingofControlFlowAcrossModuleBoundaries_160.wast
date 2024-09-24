;; 1. Test a `block` instruction that calls an imported function which itself contains a `block` with a `br` instruction. Verify if the return label is correctly managed across the module boundary.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func $testBlock 
      (block (result i32)
        (call $externalFunc)
        (br 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)