;; Place a `nop` instruction immediately before a `return` instruction at the end of a function to ensure the function returns the correct value and control flow ends properly, validating that `nop` has no side effects on return operations.

 ;; (module (func $nop_before_return (result i32) (i32.const 42) nop return))