;; 5. Use `nop` within a function that includes early returns before an `unreachable` instruction. Verify that the function returns properly without reaching the unreachable code.

(assert_return (module (func $test (result i32) (nop) (nop) (return (i32.const 42)) (unreachable)) (export "test" (func $test))) (invoke "test") (i32.const 42))