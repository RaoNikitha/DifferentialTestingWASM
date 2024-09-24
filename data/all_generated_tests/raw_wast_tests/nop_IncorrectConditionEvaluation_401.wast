;; 2. Embed a `nop` instruction within an `if` block's conditional check to ensure that the condition is evaluated accurately, and the correct branch (then or else) is taken.

 ;; (module
  (func $test-if-nop (param i32) (result i32)
    (if (result i32)
      (local.get 0)
      (then (nop) (i32.const 1))
      (else (nop) (i32.const 0))))
  (export "test" (func $test-if-nop)))