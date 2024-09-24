;; 4. Test where the `if` instruction uses the result of a previous arithmetic operation for its condition. In `WebAssembly Validator`, the correct branch is taken based on the operation's result, but in the `Wizard Engine`, the wrong branch due to improper result handling.

(assert_invalid
  (module (func $test-branch-misroute (result i32)
    (if (result i32)
      (i32.eq (i32.add (i32.const 1) (i32.const 1)) (i32.const 2))
      (then (i32.const 42))
      (else (i32.const -1))
    )
  ))
  "branch misroute"
)