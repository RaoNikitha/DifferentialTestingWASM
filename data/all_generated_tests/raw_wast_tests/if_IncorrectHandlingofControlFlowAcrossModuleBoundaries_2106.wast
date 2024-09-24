;; A test scenario where an `if` instruction inside a loop (nested within the main module) triggers a call to a function in another module, and this function contains another loop and `if` constructs ensuring the control flow returns correctly to the initial loop context.

(assert_invalid
  (module
    (import "env" "externalFunction" (func $externalFunction))
    (func $test
      (loop (if (result i32) (call $externalFunction) (i32.const 1)
        (then (if (i32.const 1) (then (i32.const 1) (call $externalFunction)) (else (br 0))))
        (else (call $externalFunction))
      ) (drop))
    )
  )
  "type mismatch"
)