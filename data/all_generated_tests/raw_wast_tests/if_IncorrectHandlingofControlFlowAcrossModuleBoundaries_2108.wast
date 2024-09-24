;; Another test where an `if` instruction inside an imported function directly calls another imported function from a different module, creating a complex multi-module interaction and testing whether control flow returns properly.

(assert_invalid
  (module
    (import "module1" "func1" (func $import1 (result i32)))
    (import "module2" "func2" (func $import2 (param i32) (result i32)))
    (func $test
      (if (result i32)
        (call $import1)
        (then (call $import2 (i32.const 10)))
        (else (call $import2 (i32.const 20))))
    )
  )
  "type mismatch"
)