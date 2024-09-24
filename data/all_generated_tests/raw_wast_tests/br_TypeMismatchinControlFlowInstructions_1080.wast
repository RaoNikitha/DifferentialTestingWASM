;; 1. Test a `br` instruction that targets a block with a mismatched operand type. For example, the target block expects an `i32` value, but the `br` instruction only provides an `i64` value. This will check if the implementation correctly validates and throws an error for type mismatches in stack values.

(assert_invalid
  (module (func $br-type-mismatch
    (block (result i32) (br 0 (i64.const 1)) (i32.const 1))
  ))
  "type mismatch"
)